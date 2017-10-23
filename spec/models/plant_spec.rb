# == Schema Information
#
# Table name: plants
#
#  id                  :integer          not null, primary key
#  sofa_name           :string
#  sofa_family         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  tnrs_name           :string
#  tnrs_family         :string
#  note                :string(3999)
#  tnrs_match          :string
#  name_status         :string
#  family              :string
#  genus               :string
#  species             :string
#  tropicos_url        :string
#  ott_id              :integer
#  accepted_rank       :string
#  matched_rank        :string
#  order_name          :string
#  common_name         :string
#  draft_id            :integer
#  published_at        :datetime
#  trashed_at          :datetime
#  variety             :string
#  tissue              :string           default("Unknown")
#  user_id             :integer
#  authority           :string
#  tnrs_name_submitted :string
#

require 'rails_helper'

RSpec.describe Plant, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :draft }
  
  it { is_expected.to have_many :publications }
  it { is_expected.to have_many :plants_pubs }
  it { is_expected.to have_many :datasets }
  it { is_expected.to have_many :pubs }
  it { is_expected.to have_many :results }
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :sofa_name }
  it { is_expected.to have_db_column :sofa_family }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :tnrs_name }
  it { is_expected.to have_db_column :tnrs_family }
  it { is_expected.to have_db_column :note }
  it { is_expected.to have_db_column :tnrs_match }
  it { is_expected.to have_db_column :name_status }
  it { is_expected.to have_db_column :family }
  it { is_expected.to have_db_column :genus }
  it { is_expected.to have_db_column :species }
  it { is_expected.to have_db_column :tropicos_url }
  it { is_expected.to have_db_column :ott_id }
  it { is_expected.to have_db_column :accepted_rank }
  it { is_expected.to have_db_column :matched_rank }
  it { is_expected.to have_db_column :order_name }
  it { is_expected.to have_db_column :common_name }
  it { is_expected.to have_db_column :draft_id }
  it { is_expected.to have_db_column :published_at }
  it { is_expected.to have_db_column :trashed_at }
  it { is_expected.to have_db_column :variety }
  it { is_expected.to have_db_column :tissue }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :authority }
  it { is_expected.to have_db_column :tnrs_name_submitted }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :order_name }
  it { is_expected.to validate_presence_of :family }
  it { is_expected.to validate_presence_of :genus }
  it { is_expected.to validate_presence_of :species }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  it 'removes pub table on destroy' do
    pb = create(:plants_pub)
    expect(PlantsPub.find_by(id: pb.id)).to_not be nil
    pb.plant.draft_destruction
    pb.plant.draft.publish!
    expect(PlantsPub.find_by(id: pb.id)).to be nil
  end
  
end
