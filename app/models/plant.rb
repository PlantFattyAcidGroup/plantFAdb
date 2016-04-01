class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_and_belongs_to_many :pubs
  has_many :results#, through: :publications
  has_paper_trail
  
  def display_name
    "#{genus} #{species}"
  end
end
