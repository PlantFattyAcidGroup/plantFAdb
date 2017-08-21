class Dataset < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  desc 'transfer_results', "reorganize result data into datasets"
  def transfer_results
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    ::Result.transaction do
      pbar = ProgressBar.new(PlantsPub.count)
      sofa_id = Dbxref.find_by(name: 'SOFA').id
      ::PlantsPub.find_each do |pb|
        ::Result.where(plants_pub_id: pb).includes(:publication).group_by(&:sofa_tab_id).each do |tab,results|
          d = ::Dataset.create_with(remarks: results.first.publication.try(:remarks), lipid_measure: '-', dbxref_id: (tab.blank? ? nil : sofa_id))
                     .find_or_create_by(plants_pub_id: pb.id, dbxref_value: tab)
          ::Result.where(id: results.map(&:id)).update_all(dataset_id: d.id)
        end
        pbar.increment!
      end
    end
  end
  
  desc 'check plant', 'check tnrs submitted name against plant file'
  method_option :output, aliases: '-o', desc: 'Output file', required: true
  def check_plants(plant_file,dataset_file,corrections_file)
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    xlsx_dataset = Roo::Spreadsheet.open(dataset_file)
    xlsx_plant = Roo::Spreadsheet.open(plant_file)
    xlsx_correction = Roo::Spreadsheet.open(corrections_file)
    out = File.open(options[:output],'w')
    
    plant_lookup = {}
    corrections = {}
    puts "--Parsing plants"
    xlsx_plant.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
      # skip empty
      next if row[4].blank?
      plant_lookup[row[4].to_s.squish] = row
    end
    
    puts "--parsing corrections"
    xlsx_correction.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
      # skip empty
      next if row[1].blank? || row[2].blank?
      
      corrections[row[2].to_s] = row[1].to_s
    end
    
    puts "--Parsing datasets"
    plant_names = {}
    total_rows = 0
    skipped_rows = 0
    xlsx_dataset.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
      if (flag = row[2].to_s).blank? || (flag != 'enter')
        skipped_rows+=1
        next
      end
      total_rows +=1
      s = row[6].to_s.squish
      plant_names[s]||=[]
      plant_names[s] << row
    end
    uniq_names = plant_names.keys
    puts "\nFound #{uniq_names.length} uniq names in #{total_rows} rows"
    puts "--Skipped #{skipped_rows} rows"
    puts "\n--Looking for plants"
    found = 0
    found_with_correction = 0
    not_found = {}
    not_found_rows = 0
    plant_names.each do |s,rows|
      if plant_lookup[s]
        found +=1
      else
        if corrections[s] && plant_lookup[corrections[s]]
          found_with_correction +=1
        else
          not_found[s]=rows
          not_found_rows += rows.length
          rows.each do |r|
            out.puts r.map(&:to_s).to_csv
          end
        end
      end
    end
    puts "Found: #{found}"
    puts "Found with correction file: #{found_with_correction}"
    puts "Not Found dataset species: #{not_found.keys.length}"
    puts "Not Found dataset rows: #{not_found_rows}\n"
    #puts "\n--\n#{not_found.join("\n")}"
  end
  
  
end