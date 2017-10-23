# == Schema Information
#
# Table name: datasets
#
#  id            :integer          not null, primary key
#  remarks       :string
#  notes         :string
#  lipid_type    :string
#  dbxref_value  :string
#  plants_pub_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  draft_id      :integer
#  published_at  :datetime
#  trashed_at    :datetime
#  dbxref_id     :integer
#  tissue        :string
#

require 'rails_helper'

RSpec.describe Dataset, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :dbxref }
  it { is_expected.to belong_to :plants_pub }
  it { is_expected.to belong_to :draft }
  
  it { is_expected.to have_many :results }
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :remarks }
  it { is_expected.to have_db_column :notes }
  it { is_expected.to have_db_column :lipid_type }
  it { is_expected.to have_db_column :dbxref_value }
  it { is_expected.to have_db_column :plants_pub_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :draft_id }
  it { is_expected.to have_db_column :published_at }
  it { is_expected.to have_db_column :trashed_at }
  it { is_expected.to have_db_column :dbxref_id }
  it { is_expected.to have_db_column :tissue }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :plants_pub }
  context 'with dbxref_value' do
    before(:each) {subject.dbxref_value = '1'}
    it { is_expected.to validate_presence_of :dbxref }
  end
  context 'without dbxref_value' do
    before(:each) {subject.dbxref_value = nil}
    it { is_expected.to_not validate_presence_of :dbxref }
  end

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  it 'removes results on destroy' do
    result = create(:result)
    expect(Result.find_by(id: result.id)).to_not be nil
    result.dataset.draft_destruction
    result.dataset.draft.publish!
    expect(Result.find_by(id: result.id)).to be nil
  end
end
