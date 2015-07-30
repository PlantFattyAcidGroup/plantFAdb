class Id < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  desc 'load_lipid_map', "Load lipid map IDS"
  def load_lipid_map filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    # parse and load new names
    puts "loading file data"
    ambig = 0
    not_found = 0
    unknown = 0
    count = 0
    good=0
    pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    ::FattyAcid.transaction do
      PaperTrail.enabled=false
      file.each_with_index do |line,idx|
        pbar.increment!
        next if idx == 0
        data = line.parse_csv
        new_id = data[1]
        sofa_mol_id = data[2]
        fa = FattyAcid.find_by(sofa_mol_id: sofa_mol_id)
        count+=1
        case new_id
        when "LM not found"
          fa.update_attribute(:lipidmap_id, "not found")
          not_found+=1
        when "ambiguous"
          fa.update_attribute(:lipidmap_id, "ambiguous")
          ambig+=1
        when /LM/
          fa.update_attribute(:lipidmap_id, new_id)
          good+=1
        else
          fa.update_attribute(:lipidmap_id,new_id)
          unknown +=1
        end
      end
    end
    puts "- #{count} items processed"
    puts "- #{good} with ID"
    puts "- #{ambig} indefinite"
    puts "- #{not_found} not found"
    puts "- #{unknown} unknown"
  end
  
  desc 'load_pubchem', "Load pubchem IDS"
  def load_pubchem filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    # parse and load new names
    puts "loading file data"
    pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    cas_no_pub=0
    with_pub=0
    count=0
    ::FattyAcid.transaction do
      PaperTrail.enabled=false
      file.each_with_index do |line,idx|
        pbar.increment!
        next if idx == 0
        count+=1
        data = line.parse_csv
        pubc_id = data[7]
        cas_number = data[6]
        sofa_mol_id = data[2]
        next if cas_number.blank? && pubc_id.blank?
        if(pubc_id.blank?)
          cas_no_pub+=1
        end
        with_pub+=1
        fa = FattyAcid.find_by(sofa_mol_id: sofa_mol_id)
        fa.pubchem_id = pubc_id
        fa.save!
      end
    end
    puts "- #{count} items processed"
    puts "- #{with_pub} matches loaded"
    puts "- #{cas_no_pub} with cas had no pub"
  end
  
end