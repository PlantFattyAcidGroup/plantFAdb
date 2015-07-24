class Id < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  desc 'load_lipid_map', "Load lipid map IDS"
  def load_lipid_map filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    # parse and load new names
    puts "loading file data"
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
        puts fa.id
        case new_id
        when "LM not found"
          fa.update_attribute(:lipidmap_id, "not found")
          puts "not found"
        when "ambiguous"
          fa.update_attribute(:chebi_id, "ambiguous")
          fa.update_attribute(:lipidmap_id, "ambiguous")
          fa.update_attribute(:pubchem_id, "ambiguous")
          fa.update_attribute(:cas_number, "ambiguous")
          puts "ambiguous"
        else
          fa.update_attribute(:lipidmap_id, new_id)
          puts new_id
        end
      end

    end
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
    ::FattyAcid.transaction do
      PaperTrail.enabled=false
      file.each_with_index do |line,idx|
        pbar.increment!
        next if idx == 0
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
    puts "NO pub: #{cas_no_pub}"
    puts "Pub: #{with_pub}"
  end
  
end