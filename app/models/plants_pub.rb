class PlantsPub < ActiveRecord::Base
  belongs_to :plant
  belongs_to :pub
  has_many :publications,  -> { distinct }, through: :results
  has_many :datasets
  has_many :results, through: :datasets
  validates :plant_id, presence: true, uniqueness: {scope: :pub_id}
  validates :pub_id, presence: true
  
  has_paper_trail
  has_drafts
  def display_name
    "#{plant.display_name} :: <i>#{pub.wos_title.try(:truncate,40)}</i> #{pub.wos_authors.try(:truncate,40)}".html_safe
  end
  
  def sofa_tabs
    publications.map(&:sofa_tab_id).uniq
  end
  
  def original_remarks
    publications.reject{|p| p.remarks.blank?}.map{|p| {sofa_tab_id: p.sofa_tab_id, remarks: p.remarks}}
  end
  
  def datasets_with_remarks
    datasets.select{|d| d.remarks.present?}
  end
  
end