class Mol < Thor
  ENV['RAILS_ENV'] ||= 'development'
  desc 'load', "Load table of SOFA molecule data"
  def load(file)
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    mol = File.open(file,'r')
    doc = Nokogiri::HTML.parse(mol.readlines.join("\n"))
    doc.search('br').each do |n|
      n.replace("\n")
    end
    pbar = ProgressBar.new(doc.css('tr').length)
    begin
      measure=nil
      pc = 0
      fc = 0
      sc = 0
      tgc = 0
      tc = 0
      with_cas=0
      PaperTrail.enabled=false
    Measure.transaction do
      doc.css('tr').each_with_index do |row,idx|
        pbar.increment!
        next if idx==0
        cols = row.css('td').map(&:content)
        case cols[1]
        when /K/
          measure = Parameter.new
          pc +=1
        when /M/
          measure = FattyAcid.new
          fc+=1
        when /S/
          measure = Sterol.new
          sc+=1
        when /TG/
          measure = Triacylglycerol.new
          tgc+=1
        when /T/
          measure = Tocopherol.new
          tc+=1
        end
        measure.sofa_mol_id = cols[1]
        measure.delta_notation = cols[2].gsub("\u0394","-delta-")
        .gsub("\uFFFD","-delta-").gsub("\u03B4","-delta-")
        .gsub("\u03B1","-alpha-").gsub("\u03B2","-beta-")
        .gsub("\u03B3","-gamma-")
        
        (cols[3]||"").split("\n").each do |name|
          measure.systematic_names.build(name: name.gsub("\uFFFD","?"))
        end
        (cols[4]||"").split("\n").each do |name|
          measure.trivial_names.build(name: name.gsub("\uFFFD","?"))
        end
        measure.cas_number = cols[5]
        with_cas+=1 unless measure.cas_number.blank?
        measure.save!
      end
    end
    rescue => e
      puts e
      puts measure.inspect
    end
    puts "#{doc.css('tr').length-1} total items:"
    puts "- Parameter: #{pc}"
    puts "- FattyAcid: #{fc}"
    puts "- Sterol: #{sc}"
    puts "- Triacylglycerol: #{tgc}"
    puts "- Tocopherol: #{tc}"
    puts "Measures with a cas registry number: #{with_cas}"
  end
  
  desc 'get_lm', "Get lipidmaps id from CAS"
  def get_lm
    not_found = File.open('cas_not_found_tox.txt','w')
    found = File.open('cas_found_inchi.txt','w')
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    fatty_acids = FattyAcid.with_results.where("cas_number is not null").to_a
    good = 0
    pbar = ProgressBar.new(fatty_acids.length)
    fatty_acids.each do |fa|
      pbar.increment!
      begin
        doc = Nokogiri::HTML(open("http://www.chem.sis.nlm.nih.gov/chemidplus/rn/#{fa.cas_number}"))
        inchikey = doc.css("#summary").first.at('span:contains("InChIKey")').content.split(":").last[1..-1]
        found.puts "#{fa.id}\t#{fa.cas_number}\t#{inchikey}\t#{fa.sofa_mol_id}"
        good+=1
      rescue
        not_found.puts "#{fa.id}\t#{fa.cas_number}\t#{fa.systematic_names.map(&:name).join(";")}\t#{fa.trivial_names.map(&:name).join(";")}\t#{fa.delta_notation}"
      end
    end
    
    puts "- #{fatty_acids.length} FattyAcids with cas number and data points"
    puts "- #{good} Found on chemidplus toxnet database"
  end
  
  desc 'parse_scifinder', "Parse data from scifinder entries"
  def parse_scifinder file
    file = File.open(file,'r')
    data = {}
    parsed = []
    after_cas = 0
    after_weight = false
    puts "CAS Registry Number\tFormula\tName\tWeight\tOther names"
    file.each do |line|
      if after_cas == 1
        after_cas = 2
        data[:formula]=line.chomp
        next
      elsif after_cas == 2
        after_cas = 0
        data[:name]=line.chomp
        next
      elsif after_weight
        after_weight = false
        data[:weight] = line.chomp
        next
      end
      
      if cas_match = line.match(/CAS Registry Number:(.*)$/)
        puts "#{data[:cas]}\t#{data[:formula]}\t#{data[:name]}\t#{data[:weight]}\t#{data[:other_names]}" if data[:cas]
        data = {}
        data[:cas] = cas_match[1].strip.chomp
        after_cas = 1
      end
      if line =~ /Molecular Weight/
        after_weight = true
      end
      if name_match = line.match(/Other Names:(.*)$/)
        data[:other_names] = name_match[1].strip.chomp
      end
    end
  end
  
  desc 'add_new_cas', 'add new cas rn by mol id'
  def add_new_cas filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    change = 0
    same = 0
    file.each_with_index do |line,idx|
      next if idx==0
      cas,mol = line.chomp.split("\t")
      fa = FattyAcid.find_by(sofa_mol_id: mol)
      cas=cas.delete 8203.chr      
      if cas != fa.cas_number
        fa.update_attribute(:cas_number, cas)
        change +=1
      else
        same +=1
      end
    end
    puts " - Updated #{change}"
    puts " - No change #{same}"
  end
  
  desc 'add_cas_data', 'add data by cas id'
  def add_cas_data file
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(file,'r')
    entries = 0
    found = 0
    not_found = []
    file.each_with_index do |line,idx|
      next if idx==0
      entries+=1
      cas,formula,name,mass,other = line.chomp.split("\t");
      fa = FattyAcid.find_by(cas_number: cas)
      if fa
        found+=1
        result = fa.update_attributes(
          formula: formula,
          name: name.gsub("\u03B1","-alpha-").gsub("\u0394","-delta-").gsub("\u03B3","-gamma-").gsub("\u03BD","-nu-").try(:gsub,"\u03B2","-beta-").try(:gsub,"\u03C9","-omega-").try(:gsub,"\u03B7","-eta-"),
          mass: mass,
          other_names: other.try(:gsub, "\u03B1","-alpha-").try(:gsub,"\u03B2","-beta-").try(:gsub,"\u0394","-delta-").try(:gsub,"\u03B3","-gamma-").try(:gsub,"\u03BD","-nu-").try(:gsub,"\u03C9","-omega-").try(:gsub,"\u03B7","-eta-")
        )
        #puts "#{cas}::#{result}"
      else
        not_found << "\t#{cas}\t #{formula}\t #{name}\t #{mass}\t #{other}"
      end
    end
    puts "- #{entries} entries"
    puts "- #{found} found in database"
    if(not_found.length > 0)
      puts "-- NOT FOUND"
      puts "\tCAS\tFormula\tName\tMass\tOther Names"
      puts not_found.join("\n")
    end
  end
    
  desc 'load_lm_data', "Load data from lipidmaps dump file"
  def load_lm_data lm_file, inchi_file
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    # Load LM data into hash
    lm_hash={}
    $/ = '$$$$'
    data = File.open(lm_file,'r').readlines
    $/ = "\n"
    puts "Loading LM datafile"
    pbar = ProgressBar.new(data.length)
    data.each do |item|
      pbar.increment!
      hsh = {}
      entries = item.split("> ").map(&:strip)
      hsh["STRUCTURE"]= entries.shift.strip
      entries.each do |entry|
        key,val = entry.gsub(/<|>/,'').split("\n")
        hsh[key]=val
      end
      lm_hash[hsh["INCHI_KEY"]]=hsh
    end
    inchi_count = 0
    good = 0
    not_found = []
    puts "Processing inchi file"
    # process inchi_file
    file = File.open(inchi_file, 'r')
    pbar = ProgressBar.new(`wc -l < "#{inchi_file}"`.to_i)
    file.each do |line|
      inchi_count+=1
      pbar.increment!
      data = line.parse_csv({:col_sep => "\t" })
      id = data[0]
      cas = data[1]
      inchi = data[2]
      
      # get FA
      fa = FattyAcid.find(id)
      unless lm = lm_hash[inchi]
        not_found << [fa,inchi]
        next
      end
      fa.update_attributes(
        lipidmap_id: lm["LM_ID"],
        pubchem_id: lm["PUBCHEM_CID"],
        structure: lm["STRUCTURE"],
        mass: lm["EXACT_MASS"],
      )
      good +=1
    end
    
    puts "- #{inchi_count} inchi keys supplied"
    puts "- #{good} LM entries found and FA's updated"
    puts "Not in LM: "
    not_found.each do |nf|
      puts "#{nf[1]} :: delta - #{nf[0].delta_notation}, pubchem - #{nf[0].pubchem_id} "
    end
  end
  
  desc 'load_opsin', "Load data from opsin"
  def load_opsin
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    puts "There are #{FattyAcid.count} fatty acids"
    fa = FattyAcid.all
    #puts "#{fa.length} have results"
    mols = fa.reject{|f| f.lipidmap_id=='ambiguous'}
    puts "#{mols.length} of these are not ambiguous"
    puts "Of these:"
    with_cas = mols.reject{|m| m.cas_number.blank?}
    puts "- #{with_cas.length} have a cas RN"
    with_name = mols.reject{|m| m.name.blank?}
    puts "- #{with_name.length} have a name"
    puts "Of the named molecules:"
    no_opsin = with_name.select{|n| n.inchi.blank?}
    puts "#{no_opsin.length} have no inchi"
    return 0 if no_opsin.empty?
    found = 0
    pbar = ProgressBar.new(no_opsin.length)
    no_data = []
    no_opsin.each do |mol|
      data = HTTParty.get("http://opsin.ch.cam.ac.uk/opsin/#{ERB::Util.url_encode mol.name}" )
      pbar.increment!
      unless data.code==200
        no_data << mol
        next
      end
      found +=1
      cml = HTTParty.get("http://opsin.ch.cam.ac.uk/opsin/#{ERB::Util.url_encode mol.name}.cml" ).body
      mol.update_attributes(
        cml: cml,
        inchi: data["inchi"],
        stdinchi: data["stdinchi"],
        stdinchikey: data["stdinchikey"],
        smiles: data["smiles"]
      )
    end
    puts "Found #{found} with opsin data"
    puts "No Data found for: "
    no_data.each do |item|
      puts "- #{item.id}: #{item.name}"
    end
  end
  
  
  desc 'compare_tables', "Compare the data in tabular file with the database. Expects 1 line header"
  method_option :update_db, default: false, desc: "Save file changes into the database"
  method_option :lookup, default: 'sofa_mol_id', desc: 'attribute to lookup fattyacid with (must be in file)'
  method_option :columns, 
    default: ['NA','delta_notation','name','other_names','formula','mass','cas_number','sofa_mol_id','lipidmap_id','pubchem_id'], 
    desc: "column names to check in file - NA to skip
    id, type, delta_notation, cas_number, sofa_mol_id, lipidmap_id, pubchem_id, chebi_id,
    mass, name, other_names, formula, cml, inchi, stdinchi, stdinchikey, smiles"
  def compare_tables filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    puts "parsing file"
    file_data = {}
    file.each_with_index do |line,idx|
      # skip any comment lines
      if line[0] == '#'
        puts "skipping comment - line: #{idx+1} #{line}"
        next
      end
      # open the file and check format
      if line.match(/\t/) 
        data = line.parse_csv({ :col_sep => "\t" })
      else
        data = line.parse_csv
      end
      # skip blank
      if data.compact.uniq.empty? || data.compact.uniq == [""]
        puts "skipping empty line: #{idx+1} #{line}"
        next
      end
      hsh = {}
      # parse columns
      options[:columns].each_with_index do |col,idx|
        next if col == 'NA'
        hsh[col.to_sym]=data[idx]
      end
      # print and skip header
      if idx == 0
        puts "-- header"
        puts Terminal::Table.new :rows => hsh.to_a
        next
      end
      # get key and push
      key = hsh[options[:lookup].to_sym]
      raise "Error - empty key for '#{options[:lookup]}' \n\tline: #{idx+1}, data: #{data.inspect}\n\t#{hsh.inspect}" unless key
      raise "Error - non-unique key '#{key}'\n\t line: #{idx+1}, data: #{data.inspect}\n\t#{hsh.inspect}" if file_data[key]
      file_data[key]=hsh
    end
    puts "Found #{file_data.length} Entries"
    
    
    puts "Loading stored data"
    pbar = ProgressBar.new(file_data.length)
    db_data_same = {}
    db_data_different = {}
    # change tracking hash
    changes = {}
    options[:columns].each do |col|
      next if col == 'NA'
      changes[col.to_sym]=0
    end
    # new item tracking hash
    inserts = {}
    options[:columns].each do |col|
      next if col == 'NA'
      inserts[col.to_sym]=0
    end
    
    file_data.each do |item_key, item_data|
      pbar.increment!
      lookup = {}
      lookup[options[:lookup].to_sym]=item_key.to_s
      fa = FattyAcid.find_by(lookup)
      # convert to plain hash
      db_item = {}
      options[:columns].each_with_index do |col,idx|
        next if col == 'NA'
        db_item[col.to_sym]=fa.send(col.to_sym)
      end
      # get key and compare
      key = db_item[options[:lookup].to_sym]
      if db_item == item_data
        db_data_same[key]=db_item
      else
        db_data_different[key]=[fa,item_data]
        # get changed columns
        options[:columns].each do |col|
          next if col == 'NA'
          unless db_item[col.to_sym]==item_data[col.to_sym]
            if db_item[col.to_sym].blank?
              inserts[col.to_sym]+=1 
            else
              changes[col.to_sym]+=1
            end
          end
        end
      end
    end
    puts "#{FattyAcid.count} Total Fatty acids in database"
    puts "#{db_data_same.length + db_data_different.length} stored items loaded"
    puts "---"
    puts "#{db_data_same.length} items identical"
    puts "#{db_data_different.length} items have changed"
    puts " --- NEW"
    table = Terminal::Table.new :rows => inserts.to_a
    puts table
    puts " --- CHANGED"
    table = Terminal::Table.new :rows => changes.to_a
    puts table
    
    if options[:update_db]
      if yes? "--update_db supplied. Do you want to save the changes? type 'y' or 'yes' to continue:"
        puts "--updating stored data"
        FattyAcid.transaction do
          pbar = ProgressBar.new(db_data_different.length)
          db_data_different.each do |key,item|
            pbar.increment!
            item[0].update_attributes!(item[1])
          end
        end
      else
        puts "--nothing saved"
      end
    else
      puts "\n --update_db not supplied. Nothing saved"
    end
    puts "\n --done"
  end
end