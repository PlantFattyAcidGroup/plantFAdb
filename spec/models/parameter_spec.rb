# == Schema Information
#
# Table name: measures
#
#  id             :integer          not null, primary key
#  type           :string
#  delta_notation :string
#  cas_number     :string
#  sofa_mol_id    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lipidmap_id    :string
#  pubchem_id     :string
#  chebi_id       :string
#  structure      :text
#  mass           :float
#  name           :string
#  other_names    :string(3999)
#  formula        :string
#  cml            :text
#  inchi          :string
#  stdinchi       :string
#  stdinchikey    :string
#  smiles         :string
#  image_link     :string
#  common_name    :string
#  category       :string
#  draft_id       :integer
#  published_at   :datetime
#  trashed_at     :datetime
#  iupac_name     :string
#  user_id        :integer
#

require 'rails_helper'

RSpec.describe Parameter, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :draft }
  
  it { is_expected.to have_many :names }
  it { is_expected.to have_many :results }
  it { is_expected.to have_many :versions }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :type }
  it { is_expected.to have_db_column :delta_notation }
  it { is_expected.to have_db_column :cas_number }
  it { is_expected.to have_db_column :sofa_mol_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :lipidmap_id }
  it { is_expected.to have_db_column :pubchem_id }
  it { is_expected.to have_db_column :chebi_id }
  it { is_expected.to have_db_column :structure }
  it { is_expected.to have_db_column :mass }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :other_names }
  it { is_expected.to have_db_column :formula }
  it { is_expected.to have_db_column :cml }
  it { is_expected.to have_db_column :inchi }
  it { is_expected.to have_db_column :stdinchi }
  it { is_expected.to have_db_column :stdinchikey }
  it { is_expected.to have_db_column :smiles }
  it { is_expected.to have_db_column :image_link }
  it { is_expected.to have_db_column :common_name }
  it { is_expected.to have_db_column :category }
  it { is_expected.to have_db_column :draft_id }
  it { is_expected.to have_db_column :published_at }
  it { is_expected.to have_db_column :trashed_at }
  it { is_expected.to have_db_column :iupac_name }
  it { is_expected.to have_db_column :user_id }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end
