class Result < ActiveRecord::Base
  belongs_to :measure
  belongs_to :publication
  belongs_to :plants_pub
  delegate :plant, to: :plants_pub
  delegate :pub, to: :plants_pub
  
  has_paper_trail
  has_drafts
  scope :viewable, -> { includes(:measure).where(measures: {type: ['FattyAcid','Parameter']}).where(unit:  ['GLC-Area-%','weight-%']) }
  validates :value, :measure_id, :unit, presence: true
  
  def display_name
    "#{measure.display_name}"
  end
  
end
