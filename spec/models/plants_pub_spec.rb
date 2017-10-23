# == Schema Information
#
# Table name: plants_pubs
#
#  id           :integer          not null, primary key
#  pub_id       :integer
#  plant_id     :integer
#  remarks      :string
#  notes        :string
#  draft_id     :integer
#  published_at :datetime
#  trashed_at   :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#
# Indexes
#
#  index_plants_pubs_on_plant_id  (plant_id)
#  index_plants_pubs_on_pub_id    (pub_id)
#

require 'rails_helper'

RSpec.describe PlantsPub, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :plant }
  it { is_expected.to belong_to :pub }
  it { is_expected.to belong_to :draft }
  
  it { is_expected.to have_many :publications }
  it { is_expected.to have_many :datasets }
  it { is_expected.to have_many :results }
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :pub_id }
  it { is_expected.to have_db_column :plant_id }
  it { is_expected.to have_db_column :remarks }
  it { is_expected.to have_db_column :notes }
  it { is_expected.to have_db_column :draft_id }
  it { is_expected.to have_db_column :published_at }
  it { is_expected.to have_db_column :trashed_at }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :user_id }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["pub_id"] }
  it { is_expected.to have_db_index ["plant_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :pub }
  it { is_expected.to validate_presence_of :plant }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  it 'removes datasets on destroy' do
    dataset = create(:dataset)
    expect(Dataset.find_by(id: dataset.id)).to_not be nil
    dataset.plants_pub.draft_destruction
    dataset.plants_pub.draft.publish!
    expect(Dataset.find_by(id: dataset.id)).to be nil
  end
  
end
