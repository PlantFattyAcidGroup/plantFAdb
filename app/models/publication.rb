class Publication < ActiveRecord::Base
  belongs_to :plant
  has_many :results
  validates :plant, presence: true
  has_paper_trail
  def display_name
    "#{authors} #{year ? "(#{year})" : ''}. #{journal} #{volume} #{page}"
  end
end
