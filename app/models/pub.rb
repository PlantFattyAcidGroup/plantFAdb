class Pub < ActiveRecord::Base
  has_and_belongs_to_many :plants
  has_many :sofa_tabs
  has_many :results
  serialize :original_pubs, Array
  has_paper_trail
  
  def display_name
    "#{wos_authors} #{wos_year ? "(#{wos_year})" : ''}. #{wos_journal} #{wos_volume} #{wos_pages}"
  end
  
  def self.condense_doi
    hsh = {}
    cnt = 0
    total_begin_pubs = Pub.count
    # Grab all DOI into hash
    Pub.find_each do |pub|
      next if pub.doi.blank? || pub.doi.downcase=='none'
      hsh[pub.doi]||=[]
      hsh[pub.doi]<<pub
      cnt+=1
    end
    dest = 0
    crt = 0
    skip = 0
    # Loop over full hash, condense non unique entries
    Pub.transaction do      
      hsh.each do |key,pubs|
        # do nothing if unique
        if pubs.length == 1
          skip+=1
          next
        end
        # sort the array - latest == best
        pubs = pubs.sort_by {|p| p.id}.reverse
        # Collect items with original sofa data
        originals = (pubs.map(&:original_pubs).flatten + [pubs]).flatten.compact.reject{|p|
          p.year.nil? && p.authors.nil? && p.journal.nil? && p.volume.nil? && p.page.nil?
        }
        originals = nil if originals.empty?
        # build pub
        new_pub = Pub.new(
          wos_uid: pubs.reject{|p| p.wos_uid.nil?}.first.try(:wos_uid),
          wos_journal: pubs[0].wos_journal,
          wos_title: pubs[0].wos_title,
          wos_volume: pubs[0].wos_volume,
          wos_authors: pubs[0].wos_authors,
          wos_pages: pubs[0].wos_pages,
          wos_year: pubs[0].wos_year,
          doi: pubs.reject{|p| p.doi.nil?}.first.try(:doi),
          abstract: pubs.reject{|p| p.abstract.nil?}.first.try(:abstract),
          url: pubs.reject{|p| p.url.nil?}.first.try(:url),
          original_pubs: originals
        )
        crt += 1
        new_pub.save!
        new_pub.plants = pubs.map(&:plants).flatten
        pubs.each do |p|
          p.results.update_all(pub_id: new_pub.id)
          p.sofa_tabs.update_all(pub_id: new_pub.id)
          p.destroy
          dest+=1
        end
      end
    end
    return {
      begin_count: total_begin_pubs,
      end_count: Pub.count,
      found: cnt,
      unique: skip,
      created: crt,
      removed: dest
    }
  end
  
end