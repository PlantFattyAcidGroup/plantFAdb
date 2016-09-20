class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_many :plants_pubs, dependent: :destroy
  has_many :pubs, through: :plants_pubs
  has_many :results#, through: :publications
  validates :order_name, presence: true
  validates :family, presence: true
  validates :genus, presence: true
  validates :species, presence: true
  
  has_paper_trail
  has_drafts
  def display_name
    if genus.blank? && species.blank?
      family || order_name || sofa_family || sofa_name || 'Unknown Plant'
    else
      "#{genus} #{species}"
    end
  end
  
  def display_type
    "Plant"
  end
end
