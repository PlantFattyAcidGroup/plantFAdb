class Result < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  method_option :measure_type, aliases: '-m'
  method_option :skip_units, aliases: '-s', type: :array
  method_option :skip_measure_types, aliases: '-n', type: :array
  desc 'dump', "dump result data"
  def dump
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    # IGNORE MEASURE STI
    Measure.inheritance_column = nil
    # Grab all the results
    @results = ::Result.includes(:measure, dataset: [plants_pub: [:plant, :pub]]).references(:measure, dataset: [plants_pub: [:plant, :pub]])
    @results = @results.where(measures: {type: options[:measure_type]}) if options[:measure_type]
    @results = @results.where.not(measures: {type: options[:skip_measure_types]}) if options[:skip_measure_types]
    @results = @results.where("unit not in ('#{options[:skip_units].join("','")}') or unit is null") if options[:skip_units]
    @results = @results.order("pubs.wos_title asc, measures.type asc")
    puts "ID\tType\tDelta Notation\tPublication\tDOI\tUID\tDBxref\tOrder\tFamily\tGenus\tSpecies\tValue\tUnit"
    @results.each do |r|
      row =  [
        r.id,
        r.measure.type,
        r.measure.delta_notation,
        r.pub.display_name,
        r.pub.doi,
        r.pub.wos_uid,
        r.dataset.dbxref_value,
        r.plant.order_name,
        r.plant.family,
        r.plant.genus,
        r.plant.species,
        r.value,
        r.unit
      ]
      puts row.join("\t")
    end
  end
  
  # Remove the old SOFA Sterol datapoints
  desc 'remove_sterols', 'delete all datapoints that are not a fatty acid or parameter'
  def remove_sterols
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    @results = ::Result.includes(:measure).references(:measure)
                       .where.not(measures: {type: ['FattyAcid', 'Parameter']})
    if yes?("Remove #{@results.count} items? (y or yes to continue): ")
      puts '..deleting'
      @results.pluck(:id).each_slice(999) do |ids|
        puts ::Result.all.where(id: ids).delete_all
      end
      # IGNORE MEASURE STI
      Measure.inheritance_column = nil
      Name.inheritance_column = nil
      PaperTrail.enabled = false
      ::Measure.all.where.not(type: ['FattyAcid', 'Parameter']).destroy_all
    end
    
  end
  
  desc 'mol_to_wt FILE', "replace mol% with wt% values"
  def mol_to_wt filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    puts "loading file data"
    vals = {}
    blanks = 0
    total = 0
    file.each_with_index do |line,idx|
      id,val = line.chomp.split("\t")
      total +=1
      if val.blank?
        blanks +=1
        next
      end
      if vals[id]
        puts "Double entry?!: #{id}\t#{val}"
      else
        vals[id]=val
      end
    end
    puts "Found: #{vals.keys.length} unique IDs and #{blanks} empty entries for #{total} lines"
    pbar = ProgressBar.new(vals.length)
    vals.each do |key,val|
      pbar.increment!
      r = ::Result.find(key)
      r.update_attributes(unit: 'weight-%', value: val, old_mol_val: r.value)
    end
  end
  
end