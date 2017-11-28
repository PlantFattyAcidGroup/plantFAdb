# == Schema Information
#
# Table name: results
#
#  id             :integer          not null, primary key
#  value          :decimal(8, 2)
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
# Foreign Keys
#
#  fk_rails_...  (measure_id => measures.id)
#  fk_rails_...  (publication_id => publications.id)
#

FactoryGirl.define do
  factory :result do
    dataset
    measure
    published_at Date.today
    trait :draft do
      published_at nil
    end
    value {Faker::Number.decimal(2, 2)}
    unit {['GLC-Area-%','weight-%'].sample}
  end
end
