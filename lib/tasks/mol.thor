class Mol < Thor
  ENV['RAILS_ENV'] ||= 'development'
  desc 'load', "Load table of SOFA molecule data"
  def load(file)
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    mol = File.open(file,'r')
    doc = Nokogiri::HTML.parse(mol.readlines.join("\n"))
    doc.search('br').each do |n|
      n.replace("\n")
    end
    pbar = ProgressBar.new(doc.css('tr').length)
    begin
      measure=nil
    Measure.transaction do
      doc.css('tr').each_with_index do |row,idx|
        pbar.increment!
        next if idx==0
        cols = row.css('td').map(&:content)
        case cols[1]
        when /K/
          measure = Parameter.new
        when /M/
          measure = FattyAcid.new
        when /S/
          measure = Sterol.new
        when /TG/
          measure = Triacylglycerol.new
        when /T/
          measure = Tocopherol.new
        end
        measure.sofa_mol_id = cols[1]
        measure.delta_notation = cols[2].gsub("\u0394","-delta-")
        .gsub("\uFFFD","-delta-").gsub("\u03B4","-delta-")
        .gsub("\u03B1","-alpha-").gsub("\u03B2","-beta-")
        .gsub("\u03B3","-gamma-")
        
        (cols[3]||"").split("\n").each do |name|
          measure.systematic_names.build(name: name.gsub("\uFFFD","?"))
        end
        (cols[4]||"").split("\n").each do |name|
          measure.trivial_names.build(name: name.gsub("\uFFFD","?"))
        end
        measure.cas_number = cols[5]
        measure.save!
      end
    end
    rescue => e
      puts e
      puts measure.inspect
    end
  end
end