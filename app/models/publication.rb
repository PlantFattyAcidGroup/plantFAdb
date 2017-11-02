# == Schema Information
#
# Table name: publications
#
#  id          :integer          not null, primary key
#  year        :string
#  authors     :string
#  journal     :string
#  volume      :string
#  page        :string
#  remarks     :string
#  plant_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sofa_tab_id :string
#
# Indexes
#
#  index_publications_on_plant_id  (plant_id)
#

class Publication < ActiveRecord::Base
  belongs_to :plant
  has_many :results
  validates :plant, presence: true
  has_paper_trail
  def display_name
    "#{authors} #{year ? "(#{year})" : ''}. #{journal} #{volume} #{page}"
  end
end
