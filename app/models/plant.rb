class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_many :plants_pubs, dependent: :destroy
  has_many :pubs, through: :plants_pubs
  has_many :results, through: :plants_pubs
  validates :order_name, :family, :genus, :species, presence: true
  validates :species, uniqueness: {
    scope: [:genus, :variety, :authority],
    case_sensitive: false,
    message: 'duplicate found in database (genus, species, variety, authority)'
  }
  validates :tnrs_name_submitted, uniqueness: {case_sensitive: false, message: 'duplicate found in database'}, allow_blank: true
  include BulkData
  
  has_paper_trail
  has_drafts
  # Binomial name
  def display_name
    if genus.blank? && species.blank?
      s=family || order_name || sofa_family || sofa_name || 'Unknown Plant'
    else
      s = "#{genus.try(:capitalize)} #{species}"
      s += " #{variety}" if variety.present?
      s += " #{authority}" if authority.present?
    end
    return s
  end
  
  def name_string
    s=display_name
    s+=" - #{common_name}" if common_name
  end
  
  def name_html
    s = display_name
    s+= "<small style='white-space:nowrap'> #{common_name}</small>" if common_name
    return s
  end
  
  def autocomplete_name
    "#{id}: #{name_string}"
  end
  
  def self.bulk_columns
    {
      "common name" => :common_name,
      "genus" => :genus,
      "species" => :species,
      "variety" => :variety,
      "authority" => :authority,
      "tissue" => :tissue,
      "order" => :order_name,
      "family" => :family,
      "tropicos url" => :tropicos_url,
      "note" => :note,
      "tnrs family" => :tnrs_family,
      "tnrs name" => :tnrs_name,
      "tnrs match" => :tnrs_match,
      "accepted rank" => :accepted_rank,
      "name submitted" => :tnrs_name_submitted,
      "matched rank" => :matched_rank,
      "name status" => :name_status
    }
  end

  def self.download_columns
    bulk_columns.merge({
      "SOFA Family" => :sofa_family,
      "SOFA Name" => :sofa_name,
      "Publication Count" => :pub_count,
      "Result Count" => :result_count
    })
  end
  
  def bulk_valid?(plants)
    plants.each do |plant|
      if plant.genus.try(:downcase) == self.genus.try(:downcase) && plant.species.try(:downcase) == self.species.try(:downcase) && plant.variety.try(:downcase) == self.variety.try(:downcase) && plant.authority.try(:downcase) == self.authority.try(:downcase)
        self.errors.add("Species", ' duplicate found in file (genus, species, variety, authority)')
      end
      if self.tnrs_name_submitted.try(:downcase).present? && plant.tnrs_name_submitted.try(:downcase) == self.tnrs_name_submitted.try(:downcase)
        self.errors.add("TNRS Name submitted", ' duplicate found in file')
      end
    end
    return self.errors.empty?
  end
end
