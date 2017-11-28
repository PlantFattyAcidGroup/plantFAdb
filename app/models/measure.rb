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

class Measure < ActiveRecord::Base
  has_many :names, dependent: :destroy
  has_many :results, dependent: :destroy
  
  has_paper_trail
  has_drafts
  
  def display_name
    delta_notation
  end
end
