class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_many :plants_pubs, dependent: :destroy
  has_many :pubs, through: :plants_pubs
  has_many :results, through: :plants_pubs
  validates :order_name, presence: true
  validates :family, presence: true
  validates :genus, presence: true
  validates :species, presence: true
  include BulkData
  
  has_paper_trail
  has_drafts
  def display_name
    if genus.blank? && species.blank?
      family || order_name || sofa_family || sofa_name || 'Unknown Plant'
    else
      "#{genus} #{species}"
    end
  end
  
  def name_string
    if binomial_name.present?
      s=binomial_name
    else
      s= "#{genus} #{species}"
      s+="(var. #{variety})" if variety
    end
    s+=" - #{common_name}" if common_name
  end
  
  def name_html
    if binomial_name.present?
      s=binomial_name
    else
      s= "#{genus} #{species}"
      s+="(var. #{variety})" if variety
    end
    s+= "<small style='white-space:nowrap'> #{common_name}</small>" if common_name
    return s
  end
  
  def autocomplete_name
    "#{id}: #{display_name} #{variety.present? ? ('(var. '+variety+')') : ''} - #{common_name} -- #{sofa_name}"
  end
  
  def self.bulk_columns
    {
      "common name" => :common_name,
      "full binomial" => :binomial_name,
      "genus" => :genus,
      "species" => :species,
      "family" => :family,
      "order" => :order_name,
      "variety" => :variety,
      "tissue" => :tissue,
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
end
