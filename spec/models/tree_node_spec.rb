# == Schema Information
#
# Table name: tree_nodes
#
#  id             :integer          not null, primary key
#  name           :string
#  common_name    :string
#  note           :string(3999)
#  ancestry       :string
#  string         :string
#  ancestry_depth :integer          default(0)
#  pos            :integer          default(0)
#  color          :string
#
# Indexes
#
#  index_tree_nodes_on_ancestry  (ancestry)
#

require 'rails_helper'

RSpec.describe TreeNode, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :common_name }
  it { is_expected.to have_db_column :note }
  it { is_expected.to have_db_column :ancestry }
  it { is_expected.to have_db_column :string }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["ancestry"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end
