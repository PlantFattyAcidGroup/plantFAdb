# == Schema Information
#
# Table name: pubs
#
#  id            :integer          not null, primary key
#  year          :string
#  authors       :string
#  journal       :string
#  volume        :string
#  page          :string
#  remarks       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  wos_uid       :string
#  wos_journal   :string
#  wos_title     :string(500)
#  wos_volume    :string
#  wos_authors   :string
#  wos_pages     :string
#  wos_year      :string
#  doi           :string
#  original_pubs :text
#  abstract      :string(4000)
#  url           :string(1000)
#  draft_id      :integer
#  published_at  :datetime
#  trashed_at    :datetime
#  user_id       :integer
#  note          :string
#

require 'rails_helper'

RSpec.describe Pub, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :draft }
  
  it { is_expected.to have_many :plants_pubs }
  it { is_expected.to have_many :datasets }
  it { is_expected.to have_many :plants }
  it { is_expected.to have_many :sofa_tabs }
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
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :wos_uid }
  it { is_expected.to have_db_column :wos_journal }
  it { is_expected.to have_db_column :wos_title }
  it { is_expected.to have_db_column :wos_volume }
  it { is_expected.to have_db_column :wos_authors }
  it { is_expected.to have_db_column :wos_pages }
  it { is_expected.to have_db_column :wos_year }
  it { is_expected.to have_db_column :doi }
  it { is_expected.to have_db_column :original_pubs }
  it { is_expected.to have_db_column :abstract }
  it { is_expected.to have_db_column :url }
  it { is_expected.to have_db_column :draft_id }
  it { is_expected.to have_db_column :published_at }
  it { is_expected.to have_db_column :trashed_at }
  it { is_expected.to have_db_column :user_id }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :wos_authors }
  it { is_expected.to validate_presence_of :wos_journal }
  it { is_expected.to validate_presence_of :wos_title }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  it 'removes pub table on destroy' do
    pb = create(:plants_pub)
    expect(PlantsPub.find_by(id: pb.id)).to_not be nil
    pb.pub.draft_destruction
    pb.pub.draft.publish!
    expect(PlantsPub.find_by(id: pb.id)).to be nil
  end
  
end
