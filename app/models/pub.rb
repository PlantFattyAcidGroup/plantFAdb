class Pub < ActiveRecord::Base
  has_and_belongs_to_many :plants
  has_many :sofa_tabs
  has_many :results
  has_paper_trail
  
  def display_name
    "#{authors} #{year ? "(#{year})" : ''}. #{journal} #{volume} #{page}"
  end
end