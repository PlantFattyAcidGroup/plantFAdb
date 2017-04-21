class Measure < ActiveRecord::Base
  has_many :names
  has_many :systematic_names, dependent: :destroy
  has_many :trivial_names, dependent: :destroy
  has_many :results
  
  has_paper_trail
  has_drafts
  
  def display_name
    delta_notation
  end
end
