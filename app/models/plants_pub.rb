# == Schema Information
#
# Table name: plants_pubs
#
#  id           :integer          not null, primary key
#  pub_id       :integer
#  plant_id     :integer
#  remarks      :string
#  notes        :string
#  draft_id     :integer
#  published_at :datetime
#  trashed_at   :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#
# Indexes
#
#  index_plants_pubs_on_plant_id  (plant_id)
#  index_plants_pubs_on_pub_id    (pub_id)
#

class PlantsPub < ActiveRecord::Base
  belongs_to :plant
  belongs_to :pub
  has_many :publications,  -> { distinct }, through: :results
  has_many :datasets, dependent: :destroy
  has_many :results, through: :datasets
  validates :plant_id, uniqueness: {scope: :pub_id}
  validates :pub, :plant, presence: true
  
  has_paper_trail
  has_drafts
  def display_name
    "#{plant.try(:display_name)} :: <i>#{pub.try(:wos_title).try(:truncate,40)}</i> #{pub.try(:wos_authors).try(:truncate,40)}".html_safe
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
