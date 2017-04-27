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
  
  def detailed_name
    "#{id}: #{display_name} #{variety.present? ? ('(var. '+variety+')') : ''} - #{common_name} -- #{sofa_name}"
  end
  
  def self.bulk_columns
    {
      "common name" => :common_name,
      "name status" => :name_status,
      "matched rank" => :matched_rank,
      "order" => :order_name,
      "family" => :family,
      "genus" => :genus,
      "species" => :species,
      "variety" => :variety,
      "tissue" => :tissue,
      "tropicos url" => :tropicos_url,
      "tnrs name" => :tnrs_name,
      "tnrs family" => :tnrs_family,
      "tnrs match" => :tnrs_match,
      "accepted rank" => :accepted_rank,
      "note" => :note
    }
  end

end
