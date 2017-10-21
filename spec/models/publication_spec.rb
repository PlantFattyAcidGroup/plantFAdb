# == Schema Information
#
# Table name: publications
#
#  id          :integer          not null, primary key
#  year        :string
#  authors     :string
#  journal     :string
#  volume      :string
#  page        :string
#  remarks     :string
#  plant_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sofa_tab_id :string
#
# Indexes
#
#  index_publications_on_plant_id  (plant_id)
#

require 'rails_helper'

RSpec.describe Publication, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :plant }
  
  it { is_expected.to have_many :results }
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :year }
  it { is_expected.to have_db_column :authors }
  it { is_expected.to have_db_column :journal }
  it { is_expected.to have_db_column :volume }
  it { is_expected.to have_db_column :page }
  it { is_expected.to have_db_column :remarks }
  it { is_expected.to have_db_column :plant_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :sofa_tab_id }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["plant_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :plant }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end
