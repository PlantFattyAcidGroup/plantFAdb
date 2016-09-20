class Pub < ActiveRecord::Base
  has_many :plants_pubs, dependent: :destroy
  has_many :plants, through: :plants_pubs
  has_many :sofa_tabs
  has_many :results
  serialize :original_pubs, Array
  validates :wos_authors, presence: true
  validates :wos_journal, presence: true
  validates :wos_title, presence: true
  
  has_paper_trail
  has_drafts
  def display_name
    "#{wos_authors} #{wos_year ? "(#{wos_year})" : ''}. #{wos_journal} #{wos_volume} #{wos_pages}"
  end
  
  def display_type
    "Publication"
  end
  
  def self.condense_wos
    hsh = {}
    total_begin_pubs = Pub.count
    # Grab all WOS into hash
    found = 0
    Pub.find_each do |pub|
      next if pub.wos_uid.blank? || pub.wos_uid.downcase=='none'
      hsh[pub.wos_uid]||=[]
      hsh[pub.wos_uid]<<pub
      found +=1
    end
    result = self.condense_hash(hsh)
    return result.merge({
      found: found,
      begin_count: total_begin_pubs,
      end_count: Pub.count
      })
  end
  
  def self.condense_doi
    hsh = {}
    total_begin_pubs = Pub.count
    # Grab all DOI into hash
    found = 0
    Pub.find_each do |pub|
      next if pub.doi.blank? || pub.doi.downcase=='none'
      hsh[pub.doi]||=[]
      hsh[pub.doi]<<pub
      found +=1
    end
    result = self.condense_hash(hsh)
    return result.merge({
      found: found,
      begin_count: total_begin_pubs,
      end_count: Pub.count
      })
  end
  
  def self.condense_hash hsh
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
          wos_journal: pubs.reject{|p| p.wos_journal.nil?}.first.try(:wos_journal),
          wos_title: pubs.reject{|p| p.wos_title.nil?}.first.try(:wos_title),
          wos_volume: pubs.reject{|p| p.wos_volume.nil?}.first.try(:wos_volume),
          wos_authors: pubs.reject{|p| p.wos_authors.nil?}.first.try(:wos_authors),
          wos_pages: pubs.reject{|p| p.wos_pages.nil?}.first.try(:wos_pages),
          wos_year: pubs.reject{|p| p.wos_year.nil?}.first.try(:wos_year),
          doi: pubs.reject{|p| p.doi.nil?}.first.try(:doi),
          abstract: pubs.reject{|p| p.abstract.nil?}.first.try(:abstract),
          url: pubs.reject{|p| p.url.nil?}.first.try(:url),
          original_pubs: originals
        )
        crt += 1
        new_pub.save!
        new_pub.plants = pubs.map(&:plants).flatten.uniq
        pubs.each do |p|
          p.results.update_all(pub_id: new_pub.id)
          p.sofa_tabs.update_all(pub_id: new_pub.id)
          p.destroy
          dest+=1
        end
      end
    end
    return {
      unique: skip,
      created: crt,
      removed: dest
    }
  end
  
end