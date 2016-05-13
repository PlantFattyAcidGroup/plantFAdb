class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_many :plants_pubs, dependent: :destroy
  has_many :pubs, through: :plants_pubs
  has_many :results#, through: :publications
  has_paper_trail
  
  def display_name
    "#{genus} #{species}"
  end
end
