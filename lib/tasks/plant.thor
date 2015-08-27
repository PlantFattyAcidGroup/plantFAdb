class Plant < Thor
  require 'csv'
  ENV['RAILS_ENV'] ||= 'development'
  
  # THIS no opinion file was resubmitted with only genus/species
  # check if different family names were found
  desc 'check_tnrs_no_op', "Check No opinion data from TNRS"
  def check_tnrs_no_op filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    # get database plants
    STDERR.puts "Loading plants"
    db_plants = {}
    ::Plant.find_each do |plant|
      db_plants[plant.id.to_s]=plant
    end
    
    changed_count = 0
    family_change = 0
    note_only=0
    # parse and load new names
    STDERR.puts "loading file data"
    ::Plant.transaction do
      PaperTrail.enabled=false
      file.each_with_index do |line,idx|
        next if idx == 0
        data = line.parse_csv({ :col_sep => "\t" })
				
        selected = data[33]
        next unless selected =='TRUE'
        
        new_attr = {
          note: data[0],
          name_status: data[26]||'none',
          tnrs_family: data[32],
          tnrs_name: data[27],
  				accepted_rank: data[29]||'none',
  				matched_rank: data[5]||'none',
          tropicos_url: data[8],
          family: data[13],
          genus: data[14],
          species: data[16] 
        }
        
        plant_id = data[37]
                
        # check plant
        plant = db_plants[plant_id]
        plant.assign_attributes new_attr
        if plant.changed?
          changed_count+=1
          if plant.changed==['note']
            note_only+=1
            next
          end
          
          puts "\n"
          puts "Plant:\thttp://phylofadb.bch.msu.edu/plants/#{plant.id}/edit"
          puts "Sofa Family/Name\t#{plant.sofa_family}\t#{plant.sofa_name}"
          puts "Name Submitted:\t#{data[2]}"
          puts "\tAttribute\tOld\tNew"
          plant.changes.each do |method,val|
            old,change = val
            puts "\t#{method}\t#{old}\t#{change}"
          end
          puts "\n"
        end
        
      end
    end
    STDERR.puts "Total changed: #{changed_count}"
    STDERR.puts "- Note only: #{note_only}"
  end

  desc 'load_tnrs_full', "Load detailed tnrs data"
  def load_tnrs_full filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    # get database plants
    puts "Loading plants"
    db_plants = {}
    ::Plant.find_each do |plant|
      db_plants[plant.id.to_s]=plant
    end
    status_count = {}
    tnrs_family_c = 0
    matched_family_c = 0
    # parse and load new names
    puts "loading file data"
    pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    ::Plant.transaction do
      PaperTrail.enabled=false
      file.each_with_index do |line,idx|
        pbar.increment!
        next if idx == 0
        data = line.parse_csv({ :col_sep => "\t" })
				
        selected = data[32]
        next unless selected =='TRUE'
        
        name_status = data[25]
        # Accepted
        tnrs_family = data[31]
        tnrs_name = data[26]
				accepted_rank = data[28]
        # Matched
				matched_rank = data[4]
        url = data[7]
        family = data[12]
        genus = data[13]
        species = data[15]
        plant_id = data[36]
        
        # update counts
        status_count[name_status]||=0
        status_count[name_status]+=1
        tnrs_family_c +=1 unless tnrs_family.blank?
        matched_family_c +=1 unless matched_family_c.blank?
        
        # update plant
        plant = db_plants[plant_id]        
        plant.update_attributes(
          name_status: name_status||'none',
          tnrs_family: tnrs_family,
          tnrs_name: tnrs_name,
          accepted_rank: accepted_rank||'none',
          matched_rank: matched_rank||'none',
          tropicos_url: url,
          family: family,
          genus: genus,
          species: species
        )
      end
    end
    puts "Total Plants: #{::Plant.count}"
    status_count.each do |key,val|
      puts "- #{key}: #{val}"
    end
    puts "- Accepted families: #{tnrs_family_c}"
    puts "- Name matched families: #{matched_family_c}"
    
  end
  
  desc 'load_tnrs', "Load new tropicos names"
  def load_tnrs filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    # get database plants
    puts "Loading plants"
    db_plants = {}
    ::Plant.find_each do |plant|
      db_plants[plant.id.to_s]=plant
    end
    with_t =0
    no_t = 0
    accepted=0
    synonym=0
    no_opinion=0
    orth_var=0
    error=0
    # parse and load new names
    puts "loading file data"
    pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    ::Plant.transaction do
      PaperTrail.enabled=false
      file.each_with_index do |line,idx|
        pbar.increment!
        next if idx == 0
        data = line.parse_csv({ :col_sep => "\t" })
        accepted_name=data[5]
        accepted_family=data[7]
        plant_id=data[11]
        plant = db_plants[plant_id]
        case data[4]
        when 'Accepted'
          accepted+=1
        when 'Synonym'
          synonym+=1
        when 'Orth. var.'
          orth_var+=1
        when 'No opinion'
          no_opinion+=1
          next
        else
          error +=1
          next
        end
        
        plant.update_attribute(:tnrs_name, accepted_name)
        plant.update_attribute(:tnrs_family, accepted_family)
      end
    end
    puts "_ #{accepted+synonym+no_opinion+orth_var+error} total names processed"
    puts "- #{accepted} Accepted names"
    puts "- #{synonym} Synonym (used accepted name)"
    puts "- #{orth_var} Orthographic variants"
    puts "- #{no_opinion} No opinion"
    puts "- #{error} No matches found (Illegitimate,Invalid,Rejected,No Matches Found)"
  end
  
  # ONLY USED FOR LOOKUP / COUNTING OF KATENOV UPDATED NAMES
  desc 'load', "Load tropicos data"
  def load_tropicos(filename)
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    multi_names = []
    missing_names = []
    puts "loading file data"
    pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    plant_data = {}
    file.each_with_index do |line,idx|
      pbar.increment!
      next if idx == 0
      data = CSV.parse_line(line)
      sofa_species = data[2]
      sofa_family = data[3]
      tropicos_species = data[5]
      tropicos_family = data[6]
      plant_data["#{(sofa_family||'NIL').downcase.strip.gsub(/\s+/, ' ').encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})}:::#{(sofa_species||'NIL').downcase.strip.gsub(/\s+/, ' ').encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})}"]||=[]
      plant_data["#{(sofa_family||'NIL').downcase.strip.gsub(/\s+/, ' ').encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})}:::#{(sofa_species||'NIL').downcase.strip.gsub(/\s+/, ' ').encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})}"] << [tropicos_family,tropicos_species]
    end
    puts "Loading plants"
    found = []
    nf = []
    db_plants = {}
    pbar = ProgressBar.new(::Plant.count)
    ::Plant.find_each do |plant|
      key_string = "#{(plant.family||'NIL').downcase.strip.gsub(/\s+/, ' ')}:::#{(plant.name||'NIL').downcase.strip.gsub(/\s+/, ' ')}"
      db_plants[key_string]||=[]
      db_plants[key_string]<<plant
      tropicos = plant_data[key_string]
      if tropicos
        found << [plant, tropicos]
      else
        nf << [plant, key_string]
      end
      pbar.increment!
    end
    
    puts "TOTAL: #{::Plant.count}"
    puts "\tFound: #{found.length}"
    puts "\tNot: #{nf.length}"
    
    db_found=[]
    db_nf=[]
    plant_data.each do |key,values|
      item = db_plants[key]
      if item
        db_found << key
      else
        db_nf << [key,values]
      end
    end
    puts "comparing the Kate file against database plants:"
    puts "found #{plant_data.length} KATE lit plants - non-unique: #{plant_data.values.map(&:length).sum}"
    puts "\tFound: #{db_found.length}"
    puts "\tNot: #{db_nf.length}"
    puts "\n\n\n"
    db_nf[0,50].each do |nf|
      puts "#{nf[0]} -- #{nf[1]}"
    end
    # ::Plant.transaction do
    #   file.each_with_index do |line,idx|
    #     pbar.increment!
    #     next if idx == 0
    #     data = CSV.parse_line(line)
    #     sofa_species = data[2]
    #     sofa_family = data[3]
    #     tropicos_species = data[5]
    #     tropicos_family = data[6]
    #     # find plant
    #     plant = ::Plant.all
    #     plant = plant.where("upper(name) = '#{sofa_species.upcase.gsub('\'',"''" )}' ") if sofa_species
    #     plant = plant.where("upper(family) = '#{sofa_family.upcase.gsub('\'',"''" )}' ") if sofa_family
    #     if plant.length > 0
    #       if(plant.length > 1)
    #         #raise "Multiple matches!! #{data.inspect} \n\n #{plant.map(&:inspect)}"
    #         multi_names << [sofa_species,sofa_family,tropicos_species,tropicos_family]
    #       end
    #       plant = plant.first
    #       #puts "found #{plant.name}::#{plant.family}"
    #     else
    #       #raise "not found -- #{data.inspect}"
    #       missing_names << [sofa_species,sofa_family,tropicos_species,tropicos_family]
    #     end
    #   end
    #   puts "Multi: #{multi_names.length}"
    #   puts "Miss: #{missing_names.length}"
    # end
  end
  
  # USED FOR LOOKUP / COUNTING OF SOFA LITERATURE LISTING
  desc 'check_plants', "Check plants"
  def check_plants filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    puts "loading file data"
    plant_data = {}
    file.each_with_index do |line,idx|
      next if idx == 0
      next if line[0]==','
      data = CSV.parse_line(line)
      species = data[2].try :downcase
      family = data[3].try :downcase
      key = "#{(family||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})}:::#{(species||'').encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})}"
      plant_data[key]||=[]
      plant_data[key]<< data
    end
    puts "Loading plants"
    found = []
    nf = []
    db_plants = {}
    ::Plant.find_each do |plant|
      key_string = "#{(plant.family||'').downcase.strip.gsub(/\s+/, ' ')}:::#{(plant.name||'').downcase.strip.gsub(/\s+/, ' ')}"
      db_plants[key_string]||=0
      db_plants[key_string]+=1
      # item = plant_data[key_string]
      # if item
      #   found << [plant]
      # else
      #   nf << key_string
      # end
    end
    
    # puts "comparing database plants against the SOFA file:"
    # puts "found #{db_plants.length} DB plants - non-unique: #{db_plants.values.sum}"
    # puts "\tFound: #{found.length}"
    # puts "\tNot: #{nf.length}\n#{nf[0,10].join("\n\t")}"
    db_found=[]
    db_nf=[]
    plant_data.each do |key,values|
      item = db_plants[key]
      if item
        db_found << key
      else
        db_nf << [key,values]
      end
    end
    puts "comparing the sofa file against database plants:"
    puts "found #{plant_data.length} SOFA lit plants - non-unique: #{plant_data.values.map(&:length).sum}"
    puts "\tFound: #{db_found.length}"
    puts "\tNot: #{db_nf.length}"
    
    pbar = ProgressBar.new(db_nf.map{|d| d[1].length}.sum)
    to_fix = []
    #db_nf.each do |key,rows|
    Parallel.map(db_nf.to_a, :in_threads => 10) do |key,rows|
      rows.each do |data|
        pbar.increment!
        response = HTTParty.get("http://sofa.mri.bund.de/Show_ResultDetail.php?Tab_ID=#{data[1]}")
        if html = response.parsed_response
          unless html =~ /No record found/
            puts "NEEDS FIX: #{to_fix.length} #{data.inspect}"
            to_fix << data
          end
        else
          raise "Haxorz! #{data}"
        end
      end
    end
    puts "#{to_fix.length} Need fixing"
    puts to_fix.length
    puts to_fix.map(&:inspect).join("\n")
  end
end