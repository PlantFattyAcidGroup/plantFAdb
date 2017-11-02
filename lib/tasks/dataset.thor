class Dataset < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  desc 'transfer_results', "reorganize result data into datasets"
  def transfer_results
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    ::Result.transaction do
      pbar = ProgressBar.new(PlantsPub.count)
      sofa_id = Dbxref.find_by(name: 'SOFA').id
      ::PlantsPub.find_each do |pb|
        pb_tissue = pb.plant.try(:tissue)
        pb_tissue = '-' if pb_tissue == 'Unknown'
        ::Result.where(plants_pub_id: pb).includes(:publication).group_by(&:sofa_tab_id).each do |tab,results|
          d = ::Dataset.create_with(remarks: results.first.publication.try(:remarks), tissue: pb_tissue, lipid_measure: '-', dbxref_id: (tab.blank? ? nil : sofa_id), published_at: Time.now)
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
  
  
  desc 'load', 'load dataset info using pub_id, fa_id and tnrs_submitted_name for plant lookup'
  method_option :test, aliases: '-t', desc: 'Test only without saving'
  method_option :output, aliases: '-o', desc: 'Output file', required: true
  def load(dataset_file,corrections_file)
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    xlsx_dataset = Roo::Spreadsheet.open(dataset_file)
    xlsx_correction = Roo::Spreadsheet.open(corrections_file)
    out = File.open(options[:output],'w')
    parsed_rows = 0
    skipped_rows = 0
    header = nil
    rows = []
    puts "--test supplied. Database updates will not be saved" if options[:test]
    puts "--loading corrections"
    corrections = {}
    xlsx_correction.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
      # skip empty
      next if row[1].blank? || row[2].blank?
      corrections[row[2].to_s] = row[1].to_s
    end
    puts "---#{corrections.keys.length}"
    
    puts "--loading plants"
    plant_lookup = ::Plant.pluck(:tnrs_name_submitted, :id).to_h
    puts "---#{plant_lookup.keys.length}"
    
    puts "--loading datasets"
    fa = ::FattyAcid.pluck(:id).map{|i| [i.to_s,'fa_'+i.to_s]}.to_h
    cols = {
      "keep" => :keep,
      "plant name submitted" => :tnrs_name_submitted,
      "plant id" => :plant_id,
      "pub id" => :pub_id,
      "dbxref name" => :dbxref_name,
      "dbxref id" => :dbxref_id,
      "dbxref value" => :dbxref_value,
      "remarks" => :remarks,
      "tissue" => :tissue,
      "lipid type" => :lipid_type,
      "oil content" => :oil_content
    }
    keep_idx=nil
    name_idx=nil
    xlsx_dataset.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
      
      # Parse header
      unless header
        next unless row[0].try(:value)
        next unless row[0].value.to_s.downcase.strip.gsub('*','').gsub('_',' ').gsub('-',' ')=~/#{cols.keys.join('|')}/
        header = {}
        row.each_with_index {|cell,idx| next unless cell; header[ActionView::Base.full_sanitizer.sanitize(cell.value.to_s.downcase.strip.gsub('*','').gsub('_',' ').gsub('-',' '))] = idx}
        keep_idx = header["keep"]
        name_idx = header["plant name submitted"]
        cols.delete('keep')
        cols.delete('plant name submitted')
        next
      end
      
      # check for skips
      if keep_idx && row[keep_idx].try(:value).try(:strip) != 'enter'
        skipped_rows+=1
        next
      end
      
      # build hash
      row_data = {}
      cols.each do |column,field|
        row_data[field] = row[header[column]].to_s.strip if header[column] && !row[header[column]].blank?
      end
      
      fa.each do |column,field|
        row_data[field] = row[header[column]].value.to_f if header[column] && !row[header[column]].blank?
      end
      
      # lookup plant by name
      if name_idx && row_data["plant id"].blank?
        row_name = row[name_idx].to_s.squish
        if p_id = plant_lookup[row_name]
          row_data[:plant_id] = p_id
        elsif corrections[row_name] && (p_id = plant_lookup[corrections[row_name]])
          row_data[:plant_id] = p_id
        end
      end
      
      # keep results
      parsed_rows +=1
      rows << [row_data,row]
    end
    
    puts "Parsed Rows: #{parsed_rows}"
    puts "Skipped Rows: #{skipped_rows}"
    puts "Datasets with pub_id: #{rows.select{|r| r[0][:pub_id].present?}.length}"
    puts "Datasets with plant_id: #{rows.select{|r| r[0][:plant_id].present?}.length}"
    puts "Datasets with tissue: #{rows.select{|r| r[0][:tissue].present?}.length}"
    puts "Datasets with oil_content: #{rows.select{|r| r[0][:tissue].present?}.length}"
    
    puts "--Saving datasets"
    invalid_rows = []
    new_datasets = 0
      
    pbar = ProgressBar.new(rows.length)
    begin
      ::Dataset.transaction do
        rows.each do |r,row|
          pbar.increment!
          pb = ::PlantsPub.find_or_create_by(plant_id: r[:plant_id], pub_id: r[:pub_id])
          unless pb.published?
            pb.published_at = Time.now
            if pb.valid?
              pb.save
            else
              invalid_rows << [row,pb.errors.full_messages]
              next
            end
          end
          r[:plants_pub_id] = pb.id
        
          r.delete(:plant_id)
          r.delete(:pub_id)
     
          dataset = ::Dataset.new(r)
          if dataset.valid?
            dataset.published_at = Time.now
            dataset.save
            new_datasets+=1
          else
            invalid_rows << [row,dataset.errors.full_messages]
          end
        end
        if options[:test]
          raise 'Rolling back transaction --test flag supplied'
        end
      end
      puts "Created #{new_datasets} new datasets"
      puts "Skipped #{invalid_rows.length} invalid entries"
    rescue
      puts "Tried to insert #{new_datasets} new datasets"
      puts "Skipped #{invalid_rows.length} invalid entries"
    end
    
    out.puts (['Error']+header.keys.map(&:to_s)).to_csv
    invalid_rows.each do |row, errors|
      out.puts "#{(errors+row.map(&:to_s)).to_csv}"
    end
  end
  
end