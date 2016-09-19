class Result < ActiveRecord::Base
  belongs_to :measure
  belongs_to :publication
  belongs_to :pub
  belongs_to :plant
  has_paper_trail
  scope :viewable, -> { includes(:measure).where(measures: {type: ['FattyAcid','Parameter']}).where(unit:  ['GLC-Area-%','weight-%']) }
  def plants_pub
    PlantsPub.find_by(plant: plant, pub: pub)
  end
end
