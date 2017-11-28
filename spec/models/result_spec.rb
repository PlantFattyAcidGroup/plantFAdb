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

require 'rails_helper'

RSpec.describe Result, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :measure }
  it { is_expected.to belong_to :publication }
  it { is_expected.to belong_to :dataset }
  it { is_expected.to belong_to :draft }
  
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :value }
  it { is_expected.to have_db_column :unit }
  it { is_expected.to have_db_column :measure_id }
  it { is_expected.to have_db_column :publication_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :pub_id }
  it { is_expected.to have_db_column :plant_id }
  it { is_expected.to have_db_column :old_mol_val }
  it { is_expected.to have_db_column :draft_id }
  it { is_expected.to have_db_column :published_at }
  it { is_expected.to have_db_column :trashed_at }
  it { is_expected.to have_db_column :plants_pub_id }
  it { is_expected.to have_db_column :dataset_id }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["publication_id"] }
  it { is_expected.to have_db_index ["measure_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :measure_id }
  it { is_expected.to validate_presence_of :unit }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  context 'viewable' do
    it 'filters bad units' do
      create(:result)
      create(:result, unit: 'foobar')
      expect(Result.count).to eq(2)
      expect(Result.viewable.count).to eq(1)
    end
  end
  
end
