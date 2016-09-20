class PlantsPub < ActiveRecord::Base
  belongs_to :plant
  belongs_to :pub
  validates :plant_id, uniqueness: {scope: :pub_id}
  has_drafts
end