# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  content     :text
#

require 'rails_helper'

RSpec.describe Page, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :content }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end
