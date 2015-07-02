class Plant < ActiveRecord::Base
  has_many :publications
  has_many :results, through: :publications
  
  def display_name
    "#{family} #{name}"
  end
end
