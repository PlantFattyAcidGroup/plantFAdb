# == Schema Information
#
# Table name: sofa_tabs
#
#  id          :integer          not null, primary key
#  pub_id      :integer
#  sofa_tab_id :string
#

require 'rails_helper'

RSpec.describe SofaTab, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :pub }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :pub_id }
  it { is_expected.to have_db_column :sofa_tab_id }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end
