# == Schema Information
#
# Table name: pubs
#
#  id            :integer          not null, primary key
#  year          :string
#  authors       :string
#  journal       :string
#  volume        :string
#  page          :string
#  remarks       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  wos_uid       :string
#  wos_journal   :string
#  wos_title     :string(500)
#  wos_volume    :string
#  wos_authors   :string
#  wos_pages     :string
#  wos_year      :string
#  doi           :string
#  original_pubs :text
#  abstract      :string(4000)
#  url           :string(1000)
#  draft_id      :integer
#  published_at  :datetime
#  trashed_at    :datetime
#  user_id       :integer
#  note          :string
#

class Pub < ActiveRecord::Base
  has_many :plants_pubs, dependent: :destroy
  has_many :datasets, through: :plants_pubs
  has_many :plants, through: :plants_pubs
  has_many :sofa_tabs, dependent: :destroy
  has_many :results, through: :plants_pubs
  serialize :original_pubs, Array
  validates :wos_authors, presence: true
  validates :wos_journal, presence: true
  validates :wos_title, presence: true
  include BulkData
  
  has_paper_trail
  has_drafts
  def display_name
    s = "#{wos_title} #{wos_authors} #{wos_journal} #{wos_year.blank? ? '' : "(#{wos_year})"}  #{wos_volume} #{wos_pages}"
    s = '-' if s.blank?
    s.html_safe
  end
  
  def self.bulk_columns
    {
      "authors" => :wos_authors,
      "year" => :wos_year,
      "title" => :wos_title,
      "journal" => :wos_journal,
      "volume" => :wos_volume,
      "pages" => :wos_pages,
      "doi" => :doi,
      "uid" => :wos_uid,
      "abstract" => :abstract,
      "url" => :url
    }
  end
  def bulk_valid?(pubs)
    return true
  end
  
  # Condense is currently disabled
  # These methods were previously used to allow merging multiple identical publications
  # based on the DOI or WOS_UID
  
  # def self.condense_wos
  #   hsh = {}
  #   total_begin_pubs = Pub.count
  #   # Grab all WOS into hash
  #   found = 0
  #   Pub.find_each do |pub|
  #     next if pub.wos_uid.blank? || pub.wos_uid.downcase=='none'
  #     hsh[pub.wos_uid]||=[]
  #     hsh[pub.wos_uid]<<pub
  #     found +=1
  #   end
  #   result = self.condense_hash(hsh)
  #   return result.merge({
  #     found: found,
  #     begin_count: total_begin_pubs,
  #     end_count: Pub.count
  #     })
  # end
  
  # def self.condense_doi
 #    hsh = {}
 #    total_begin_pubs = Pub.count
 #    # Grab all DOI into hash
 #    found = 0
 #    Pub.find_each do |pub|
 #      next if pub.doi.blank? || pub.doi.downcase=='none'
 #      hsh[pub.doi]||=[]
 #      hsh[pub.doi]<<pub
 #      found +=1
 #    end
 #    result = self.condense_hash(hsh)
 #    return result.merge({
 #      found: found,
 #      begin_count: total_begin_pubs,
 #      end_count: Pub.count
 #      })
 #  end
  
  # def self.condense_hash hsh
  #   dest = 0
  #   crt = 0
  #   skip = 0
  #   # Loop over full hash, condense non unique entries
  #   Pub.transaction do
  #     hsh.each do |key,pubs|
  #       # do nothing if unique
  #       if pubs.length == 1
  #         skip+=1
  #         next
  #       end
  #       # sort the array - latest == best
  #       pubs = pubs.sort_by {|p| p.id}.reverse
  #       # Collect items with original sofa data
  #       originals = (pubs.map(&:original_pubs).flatten + [pubs]).flatten.compact.reject{|p|
  #         p.year.nil? && p.authors.nil? && p.journal.nil? && p.volume.nil? && p.page.nil?
  #       }
  #       originals = nil if originals.empty?
  #       # build pub
  #       new_pub = Pub.new(
  #         wos_uid: pubs.reject{|p| p.wos_uid.nil?}.first.try(:wos_uid),
  #         wos_journal: pubs.reject{|p| p.wos_journal.nil?}.first.try(:wos_journal),
  #         wos_title: pubs.reject{|p| p.wos_title.nil?}.first.try(:wos_title),
  #         wos_volume: pubs.reject{|p| p.wos_volume.nil?}.first.try(:wos_volume),
  #         wos_authors: pubs.reject{|p| p.wos_authors.nil?}.first.try(:wos_authors),
  #         wos_pages: pubs.reject{|p| p.wos_pages.nil?}.first.try(:wos_pages),
  #         wos_year: pubs.reject{|p| p.wos_year.nil?}.first.try(:wos_year),
  #         doi: pubs.reject{|p| p.doi.nil?}.first.try(:doi),
  #         abstract: pubs.reject{|p| p.abstract.nil?}.first.try(:abstract),
  #         url: pubs.reject{|p| p.url.nil?}.first.try(:url),
  #         original_pubs: originals
  #       )
  #       crt += 1
  #       new_pub.save!
  #       new_pub.plants = pubs.map(&:plants).flatten.uniq
  #       pubs.each do |p|
  #         p.results.update_all(pub_id: new_pub.id)
  #         p.sofa_tabs.update_all(pub_id: new_pub.id)
  #         p.destroy
  #         dest+=1
  #       end
  #     end
  #   end
  #   return {
  #     unique: skip,
  #     created: crt,
  #     removed: dest
  #   }
  # end
end
