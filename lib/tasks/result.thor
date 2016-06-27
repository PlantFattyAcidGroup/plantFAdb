class Result < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  method_option :measure_type, aliases: '-m'
  method_option :skip_units, aliases: '-s', type: :array
  desc 'dump', "dump result data"
  def dump
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    @results = ::Result.includes(:measure,:publication,:plant).references(:measure,:publication,:plant)
    @results = @results.where(measures: {type: options[:measure_type]}) if options[:measure_type]
    @results = @results.where("unit not in ('#{options[:skip_units].join("','")}') or unit is null") if options[:skip_units]
    
    puts "ID\tDelta Notation\tPublication\tSofa Table\tOrder\tSpecies\tValue\tUnit"
    @results.find_each do |r|
      row =  [
        r.id,
        r.measure.delta_notation,
        r.pub.display_name,
        r.publication.sofa_tab_id,
        r.plant.order_name,
        r.plant.display_name,
        r.value,
        r.unit
      ]
      puts row.join("\t")
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