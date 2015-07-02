class Tab < Thor
  ENV['RAILS_ENV'] ||= 'development'
  desc 'load', "Load table of SOFA molecule data"
  def load(folder)
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    dir = Dir.new(folder)
    pbar = ProgressBar.new(dir.count) 
    begin
    file = nil
    doc = nil
    rows = nil
    tables = nil
    pub = nil
    Result.transaction do
      dir.each do |tab|
        pbar.increment!
        next unless tab =~ /TAB/
        #next unless tab == "TAB_001479.html"
        
        file = File.open(folder+'/'+tab,'r')
        doc = Nokogiri::HTML.parse(file.readlines.join("\n"))
        # catch empty results
        next if doc.css('table').count == 0
        doc.search('br').each do |n|
          n.replace("\n")
        end
        #byebug
        tables = doc.search('table')
        
        # plant / pub
        rows = tables[0].css('tr')
        # plant
        family = rows[0].css('td')[1].content
        plant_name = rows[1].css('td')[1].content
        plant = Plant.find_or_create_by(family: family.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?"), name: plant_name.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?"))
        # pub
        authors = rows[2].css('td')[1].content
        journal = rows[3].css('td')[1].content
        volume = rows[4].css('td')[1].content
        page = rows[5].css('td')[1].content
        remarks = rows[6].css('td')[1].content
        pub = Publication.create(
          authors: authors.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?"),
          journal: journal.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?"),
          volume: volume.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?"),
          page: page.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?"),
          remarks: remarks.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?")[0..254],
          plant: plant
        )
        #Results - tables are 'nested' oddly
        # first table - use xpath for direct children tr's
        rows = tables[3].xpath('./tr')
        create_all_table_rows(rows,pub,tab)
        # additional tables (if any)
        tables[3].css('table').each do |result_table|
          rows = result_table.xpath('./tr')
          create_all_table_rows(rows,pub,tab)
        end
      end#dirloop
    end#trans
    rescue => e
      puts e
      puts pub.inspect
      puts file.inspect
    end#
  end#load
  private
  
  def create_all_table_rows(rows,pub,tab)
    klass = rows[0].css('td')[0].content.gsub(" ","_").singularize.camelize
    # Triglyceride?
    klass = 'Triacylglycerol' if klass == 'Triglyceride'
    klass = klass.constantize
    #puts klass.name
    rows[1..-1].each do |row|
      name, value, unit = row.css('td').map(&:content)
      name = name.encode('UTF-8', 'UTF-8', :invalid => :replace).strip
      create_result(klass,name,value,unit,pub,tab) unless name == '-'
    end
  end
  
  def create_result(klass,name,value,unit,pub,tab)
    name = name.gsub("\u0394","-delta-")
        .gsub("\uFFFD","-delta-").gsub("\u03B4","-delta-")
        .gsub("\u03B1","-alpha-").gsub("\u03B2","-beta-")
        .gsub("\u03B3","-gamma-")
    measures = klass.where(delta_notation: name)
    if(measures.length == 0)
      # puts "\n-- #{measures.count} != 1"
      # puts "#{klass.inspect}"
      # puts measures.inspect
      # puts name.inspect
      # puts pub.inspect
      # raise "Measure not 1 to 1 !!"
      puts "#{tab}:: '#{name}'  Not Found -- value: #{value} -- unit: #{unit}"
    else
      res = Result.create(
        publication: pub,
        measure: measures.first,
        value: value.strip,
        unit: unit.strip,
      )
    end
    #puts "#{res.measure.delta_notation} :: #{res.inspect}"
  end
end#class