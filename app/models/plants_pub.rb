class PlantsPub < ActiveRecord::Base
  belongs_to :plant
  belongs_to :pub
  has_many :results
  validates :plant_id, presence: true, uniqueness: {scope: :pub_id}
  validates :pub_id, presence: true
  
  has_drafts
  
  def display_name
    "#{plant.display_name} :: <i>#{pub.wos_title.truncate(40)}</i> #{pub.wos_authors.truncate(40)}".html_safe
  end
  
  def draft_publication_dependencies
    results.map(&:draft).compact
  end
  
  def draft_reversion_dependencies
    results.map(&:draft).compact
  end
  
end