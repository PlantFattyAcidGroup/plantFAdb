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
  
  desc 'condense_wos_id', 'condense using wos_uid column'
  def condense_wos_id
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    PaperTrail.enabled = false
    pbar = ProgressBar.new(::Pub.count)
    hsh = {}
    cnt = 0
    puts "building hash"
    ::Pub.find_each do |pub|
      pbar.increment!
      next if pub.wos_uid.blank? || pub.wos_uid.downcase=='none'
      hsh[pub.wos_uid]||=[]
      hsh[pub.wos_uid]<<pub
      cnt+=1
    end
    puts "Found #{cnt} pubs with wos_uid"
    puts "Found #{hsh.keys.length} unique wos_uid"
    dest = 0
    crt = 0
    skip = 0
    ::Pub.transaction do
      pbar = ProgressBar.new(hsh.keys.length)
      hsh.each do |key,pubs|
        pbar.increment!
        # do nothing if only 1 unique
        if pubs.length == 1
          skip+=1
          next
        end
        new_pub = ::Pub.create(
          wos_uid: pubs[0].wos_uid,
          wos_journal: pubs[0].wos_journal,
          wos_title: pubs[0].wos_title,
          wos_volume: pubs[0].wos_volume,
          wos_authors: pubs[0].wos_authors,
          wos_pages: pubs[0].wos_pages,
          wos_year: pubs[0].wos_year,
          doi: pubs[0].doi,
          original_pubs: pubs
        )
        crt += 1
        new_pub.plants = pubs.map(&:plants).flatten
        pubs.each do |p|
          p.results.update_all(pub_id: new_pub.id)
          p.sofa_tabs.update_all(pub_id: new_pub.id)
          p.destroy
          dest+=1
        end
      end
    end
    puts "Skipped #{skip} pubs with 1 wos_uid"
    puts "Created #{crt} new unique pubs"
    puts "Removed #{dest} non unique"
    puts
    puts "Total pubs now: #{::Pub.count}"
    puts "Pubs with wos: #{with_wos = ::Pub.where("wos_uid != 'None'").count}"
    puts "Pubs with doi: #{with_doi = ::Pub.where("doi != 'None'").count}"
  end
  
  desc 'add_wos', 'add wos data to pubs'
  method_options %w(id_column -i) => 1, %w(title -t) => 13, %w(journal -j) => 15, %w(volume -v) => 16,
    %w(authors -a) => 20, %w(pages -p) => 18, %w(year -y) => 22, %w(doi -d) => 14, %w(wos_uid -w) => 21
  def add_wos filename
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    file = File.open(filename,'r')
    pbar = ProgressBar.new(`wc -l < "#{filename}"`.to_i)
    ids = []
    wos_ids = []
    doi_ids = []
    count = 0
    PaperTrail.enabled = false
    file.each_with_index do |line,idx|
      pbar.increment!
      next if idx==0
      data = line.split("\t")
      
      pub_id = data[ options[:id_column].to_i-1]
      next if pub_id.empty?
      wos_uid = data[ options[:wos_uid].to_i-1]
      wos_journal=data[ options[:journal].to_i-1]
      wos_title=data[ options[:title].to_i-1]
      wos_volume=data[ options[:volume].to_i-1]
      wos_authors=data[ options[:authors].to_i-1]
      wos_pages=data[ options[:pages].to_i-1]
      wos_year=data[ options[:year].to_i-1]
      doi=data[ options[:doi].to_i-1]
      
      ids << pub_id
      wos_ids << wos_uid unless wos_uid.strip.blank? || wos_uid.downcase=='none'
      doi_ids << doi unless doi.strip.blank? || doi.downcase=='none'
      count +=1
      pub = ::Pub.find_by(id: pub_id )
      if pub
        pub.wos_uid=wos_uid
        pub.wos_journal=wos_journal
        pub.wos_title=wos_title
        pub.wos_volume=wos_volume
        pub.wos_authors=wos_authors
        pub.wos_pages=wos_pages
        pub.wos_year=wos_year
        pub.doi=doi
        pub.save!
      else
        raise "NOT FOUND: #{data.inspect}"
      end
    end
    puts "Found #{count} entries in file"
    puts "- pub IDS: #{ids.length}, unique: #{ids.uniq.length}"
    puts "- wos IDS: #{wos_ids.length} unique: #{wos_ids.uniq.length}"
    puts "- doi IDS: #{doi_ids.length} unique: #{doi_ids.uniq.length}"
    
  end
  
  desc 'condense', "Condense duplicate publications into 'pubs' table keeping plant links"
  def condense
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    pbar = ProgressBar.new(::Publication.count)
    ::Publication.find_each do |pub|
      new_pub = ::Pub.find_or_create_by(
        year: pub.year.try(:squish),
        authors: pub.authors.try(:squish),
        journal: pub.journal.try(:squish),
        volume: pub.volume.try(:squish),
        page: pub.page.try(:squish),
      )
      new_pub.plants << pub.plant
      pub.results.update_all(pub_id: new_pub.id, plant_id: pub.plant_id)
      new_pub.sofa_tabs.create(sofa_tab_id: pub.sofa_tab_id)
      pbar.increment!
    end
    
    puts "- Created #{::Pub.count} unique pubs"
    
    puts "\n - Removing empty pubs/plants"
    pbar = ProgressBar.new(::Pub.count)
    ::Pub.find_each do |pub|
      pbar.increment!
      if pub.results.count == 0
        pub.destroy
      end
    end
    puts "- #{::Pub.count} pubs after cleanup"
    pbar = ProgressBar.new(::Plant.count)
    ::Plant.find_each do |plant|
      pbar.increment!
      if plant.results.count == 0
        plant.destroy
      end
    end
    puts "- #{::Plant.count} plants after cleanup"
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