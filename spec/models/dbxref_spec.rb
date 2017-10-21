# == Schema Information
#
# Table name: dbxrefs
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  link        :string
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Dbxref, regressor: true do

  # === Relations ===
  
  
  it { is_expected.to have_many :datasets }
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :link }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end
