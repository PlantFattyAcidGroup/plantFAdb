class Plant < ActiveRecord::Base
  has_many :publications
  has_many :results, through: :publications
  has_paper_trail
  
  def display_name
    "#{genus} #{species} (#{sofa_family} #{sofa_name})"
  end
end
