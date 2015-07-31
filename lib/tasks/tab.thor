class Tab < Thor
  ENV['RAILS_ENV'] ||= 'development'
  desc 'load', "Load table of SOFA molecule data"
  def load folder
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    dir = Dir.new(folder)
    pbar = ProgressBar.new(15601) 
    # counters
    load_perfect = 0
    load_create = 0
    load_ambiguous = 0
    empty = 0
    no_pub = 0
    res_count = 0
    count = 0
    new_measures = File.open("new_measures_to_create.txt",'w')
    new_measures.puts "Pub ID\tTAB\tMeasure\tName\tValue\tUnit"
    ambiguous_measures = File.open("ambiguous_measures.txt",'w')
    ambiguous_measures.puts "Pub ID\tTAB\tMeasure\tName\tValue\tUnit"
    no_pub_file = File.open("tab_with_no_pub.txt", 'w')
    
    # Turn of versions
    PaperTrail.enabled=false
    # Loop over folders
    #::Result.transaction do
    begin
      Parallel.each(dir, in_threads: 10) do |num|
        ActiveRecord::Base.connection_pool.with_connection do
          next unless num =~ /\d+/
          d = Dir.new("#{folder}/#{num}")
          d.each do |tab|
            file = nil
            doc = nil
            rows = nil
            tables = nil
            pub = nil
            needed_create = false
            ambiguous_flag = false
            pbar.increment!
            next unless tab =~ /TAB/
            count+=1
            #next unless tab == "TAB_001479.html"
          
            file = File.open("#{folder}/#{num}/#{tab}",'r')
            doc = Nokogiri::HTML.parse(file.readlines.join("\n"))
            # catch empty results
            if doc.css('table').count == 0
              empty +=1
              next
            end
            doc.search('br').each do |n|
              n.replace("\n")
            end

            tables = doc.search('table')
            rows = tables[0].css('tr')
          
            # pub
            unless pub = ::Publication.find_by(sofa_tab_id: tab.split(".")[0])
              no_pub +=1
              no_pub_file.puts tab.split(".")[0]
              next
            end
            authors = rows[2].css('td')[1].content.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?")
            journal = rows[3].css('td')[1].content.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?")
            volume = rows[4].css('td')[1].content.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?")
            page = rows[5].css('td')[1].content.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?")
            remarks = rows[6].css('td')[1].content.encode('UTF-8', 'UTF-8', :invalid => :replace).gsub("\uFFFD","?")[0..254]
            pub.update_attributes(
              authors: authors,
              journal: journal,
              volume: volume,
              page: page,
              remarks: remarks
            )
            #Results - tables are 'nested' oddly
            # first table - use xpath for direct children tr's
            rows = tables[3].xpath('./tr')
            rcnt, needed_create, ambiguous_flag = process_rows rows, pub, new_measures, ambiguous_measures            
            res_count+=rcnt
            # additional tables (if any)
            tables[3].css('table').each do |result_table|
              rows = result_table.xpath('./tr')
              rcnt, needed_create, ambiguous_flag = process_rows rows, pub, new_measures, ambiguous_measures
              res_count+=rcnt    
            end
          
            # update count
            if needed_create
              load_create+=1
            elsif ambiguous_flag
              load_ambiguous+=1
            else
              load_perfect+=1
            end
          end#dirloop
        end
      end
      puts "- #{count} total files"
      puts "- #{load_perfect} files loaded without error"
      puts "- #{load_create} files partially loaded - a measure was not found"
      puts "- #{load_ambiguous} files loaded with an ambiguous measure (first match chosen)"
      puts "- #{no_pub} files with data but no matching pub (hidden in SOFA)"
      puts "- #{empty} files empty"
      puts "- #{res_count} new data points loaded"
      #end#trans
    rescue => e
      puts e
      puts pub.inspect
      puts file.inspect
    end#
  end#load
  
  private
  
  def process_rows rows, pub, new_outfile, ambig_outfile
    klass = get_class rows
    rcnt = 0
    needed_create = false
    ambiguous_flag = false
    rows[1..-1].each do |row|
      name, value, unit = row.css('td').map(&:content)
      name = name.encode('UTF-8', 'UTF-8', :invalid => :replace).strip
      # skip empty rows
      next if name == '-'
      name = name.gsub("\u0394","-delta-")
          .gsub("\uFFFD","-delta-").gsub("\u03B4","-delta-")
          .gsub("\u03B1","-alpha-").gsub("\u03B2","-beta-")
          .gsub("\u03B3","-gamma-")
      measures = klass.where(delta_notation: name)
      if measures.empty?
        needed_create = true
        new_outfile.puts "#{pub.id}\t#{pub.sofa_tab_id}\t#{klass.name}\t#{name}\t#{value}\t#{unit}"
      else
        if measures.length > 1
          ambiguous_flag = true
          ambig_outfile.puts "#{pub.id}\t#{pub.sofa_tab_id}\t#{klass.name}\t#{name}\t#{value}\t#{unit}"
        end
      
        res = Result.create!(
          publication: pub,
          measure: measures.first,
          value: value.strip,
          unit: unit.strip,
        )
        rcnt+=1
      end
    end
    return rcnt, needed_create, ambiguous_flag
  end
  
  def get_class rows
    klass = rows[0].css('td')[0].content.gsub(" ","_").singularize.camelize
    # Triglyceride?
    klass = 'Triacylglycerol' if klass == 'Triglyceride'
    return klass.constantize
  end
end#class