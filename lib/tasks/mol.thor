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
  
  desc 'add_cas_data', 'add data by cas id'
  def add_cas_data file
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(file,'r')
    file.each do |line|
      cas,formula,name,mass,other = line.chomp.split("\t");
      fa = FattyAcid.find_by(cas_number: cas)
      if fa
        fa.update_attributes(
          formula: formula,
          name: name.gsub("\u03B1","-alpha-").gsub("\u0394","-delta-").gsub("\u03B3","-gamma-").gsub("\u03BD","-nu-"),
          mass: mass,
          other_names: other.try(:gsub, "\u03B1","-alpha-").try(:gsub,"\u0394","-delta-").try(:gsub,"\u03B3","-gamma-").try(:gsub,"\u03BD","-nu-")
        )
      else
        puts "NOT FOUND"
        puts "#{cas}:: #{formula}, #{name}, #{mass}, #{other}\n\n"
      end
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
end