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

class FattyAcid < Measure
  validates :name, presence: true
  validates :mass, presence: true
  validates :formula, presence: true
  
  scope :with_results, -> { 
    joins("left outer join (select count(r.id) result_count, m.id measure_id from results r left outer join measures m on r.measure_id = m.id group by m.id) res on res.measure_id = measures.id ")
    .where("res.result_count is not null")
  } 
  scope :without_results, -> { 
    joins("left outer join (select count(r.id) result_count, m.id measure_id from results r left outer join measures m on r.measure_id = m.id group by m.id) res on res.measure_id = measures.id ")
    .where("res.result_count is null")
  }
  
  def name_with_count
    "#{name||'?-'+delta_notation} (#{results.count})"
  end
  
  def display_name
    text = "#{delta_notation} "
    text += " #{common_name} "
    text += " - #{name}" 
  end
  
  def display_html
    text = "<span style='width:200px;display:inline-block'><b>#{delta_notation}</b></span> "
    text += "<span style='width:200px;color:blue;display:inline-block'><i>#{common_name}</i></span>"
    text += " <span>#{name}</span>" 
  end
end
