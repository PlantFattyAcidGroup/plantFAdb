class Pub < Thor
  ENV['RAILS_ENV'] ||= 'development'
  desc 'load_year_tab', "load year and tab id into pubs"
  def load_year_tab filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    puts "loading file data"
    file_hsh={}
    file.each_with_index do |line,idx|
      next if idx == 0
      next if line[0]==','
      data = line.parse_csv
      species = (data[2]||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
      family = (data[3]||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
      key_string = "#{species}:::#{family}"
      file_hsh[key_string]||=[]
      file_hsh[key_string]<<data
    end
    
    bad = 0
    multi =0
    perfect=0
    matched=0
    amb = []
    mm = 0
    pbar = ProgressBar.new ::Publication.count
    ::Publication.includes(:plant).find_each do |pub|
      pbar.increment!
      key_string = "#{(pub.plant.name||'').strip.gsub(/\s+/, ' ')}:::#{(pub.plant.family||'').strip.gsub(/\s+/, ' ')}"
      res = file_hsh[key_string]
      if res
        if(res.length > 1)
          multi+=1
          sub = []
          res.each do |data|
            tab = data[1]
            species = (data[2]||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
            family = (data[3]||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
            authors = (data[4]||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
            year = data[5]
            journal = (data[6]||"").encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
            plant_name = (pub.plant.name||'').strip.gsub(/\s+/, ' ')
            family_name = (pub.plant.family||'').strip.gsub(/\s+/, ' ')
            pub_journal = (pub.journal||'').strip.gsub(/\s+/, ' ')
            if( plant_name==species && family_name==family && journal.match(Regexp.quote(pub_journal)) && journal.match(Regexp.quote(pub.page||"")) && journal.match(Regexp.quote(pub.volume||"")) && (pub.authors||"").match(Regexp.quote(authors||"")) )
              sub << data
            end
          end
          if sub.length > 1
            amb.push [pub,sub]
          elsif sub.empty?
            mm+=1
          else
            tab = sub[0][1]
            year = sub[0][5]
            matched +=1
          end
        else
          tab = res[0][1]
          year = res[0][5]
          perfect +=1
        end
      else
        bad +=1
      end
    end
    puts "perfect: #{perfect}"
    puts "matched: #{matched}"
    puts "NOT FOUND: #{bad}"
    puts "ambig: #{amb.length}"
    puts "multi-miss: #{mm}"
    puts "= #{perfect+matched}/#{perfect+matched+bad+amb.length+mm}"
    puts "---"
    puts "multi: #{multi} == #{amb.length + mm + matched}"
    puts "\n#{amb[0,50].map{|a| "#{a[0].inspect}\n#{a[1].map{|d| "\t#{d.inspect}"}.join("\n")}"}.join("\n\n")}"
  end
  
  desc "stub", "Build base literature table to be filled in by TAB data"
  def stub filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    puts "loading file data"
    #pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    plants = {}
    pubs = []
    
    doc = Nokogiri::HTML.parse(file.readlines.join("\n"))
    doc.search('br').each do |n|
      n.replace("\n")
    end
    pbar = ProgressBar.new(doc.css('tr').length)
    
    PaperTrail.enabled = false
    ::Publication.transaction do
      doc.css('tr').each_with_index do |row,idx|
      #file.each_with_index do |line,idx|
        pbar.increment!
        next if idx == 0
        #next if line[0]==','
        data = row.css('td').map(&:content)
        #data = line.parse_csv
          # Get Plant
          species = (data[2]||"").strip.gsub(/\s+/, ' ').humanize.encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
          family = (data[3]||"").strip.gsub(/\s+/, ' ').humanize.encode('US-ASCII', {:invalid => :replace, :undef => :replace, :replace => '?'})
          plant = (plants["#{family}:::#{species}"]||=::Plant.create!(name: species, family: family))
          # Get Tab and year
          tab = data[1]
          year = data[5]
          # Stub Pub
          pubs << Publication.create!(
            sofa_tab_id: tab,
            plant: plant,
            year: year
          )
        end 
      end
    puts "Created #{pubs.length} publications"
    puts "Created #{plants.keys.length} unique plants"
  end
end