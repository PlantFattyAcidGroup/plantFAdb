class Pub < ActiveRecord::Base
  has_and_belongs_to_many :plants
  has_many :sofa_tabs
  has_many :results
  serialize :original_pubs, Array
  has_paper_trail
  
  def display_name
    "#{wos_authors} #{wos_year ? "(#{wos_year})" : ''}. #{wos_journal} #{wos_volume} #{wos_pages}"
  end
end