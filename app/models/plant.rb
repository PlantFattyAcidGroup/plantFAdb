class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_many :plants_pubs, dependent: :destroy
  has_many :pubs, through: :plants_pubs
  has_many :results#, through: :publications
  has_paper_trail
  
  def display_name
    if genus.blank? && species.blank?
      family || order_name || sofa_family || sofa_name || 'Unknown Plant'
    else
      "#{genus} #{species}"
    end
  end
  
end
