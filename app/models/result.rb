# == Schema Information
#
# Table name: results
#
#  id             :integer          not null, primary key
#  value          :string
#  unit           :string
#  measure_id     :integer
#  publication_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pub_id         :integer
#  plant_id       :integer
#  old_mol_val    :decimal(8, 2)
#  draft_id       :integer
#  published_at   :datetime
#  trashed_at     :datetime
#  plants_pub_id  :integer
#  dataset_id     :integer
#
# Indexes
#
#  index_results_on_measure_id      (measure_id)
#  index_results_on_publication_id  (publication_id)
#

class Result < ActiveRecord::Base
  belongs_to :measure
  belongs_to :publication
  belongs_to :dataset
  delegate :plants_pub, to: :dataset
  delegate :plant, to: :plants_pub
  delegate :pub, to: :plants_pub
  
  has_paper_trail
  has_drafts
  scope :viewable, -> { joins(:measure).where(measures: {type: ['FattyAcid','Parameter']}).where(unit:  ['GLC-Area-%','weight-%']) }
  validates :value, :measure_id, :unit, presence: true
  
  def display_name
    "#{measure.display_name}"
  end
  
  def sofa_tab_id
    publication.try(:sofa_tab_id)
  end
  
  def draft_publication_dependencies
    []
  end
  
  def draft_reversion_dependencies
    []
  end
  
end
