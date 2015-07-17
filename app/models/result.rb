class Result < ActiveRecord::Base
  belongs_to :measure
  belongs_to :publication
  has_paper_trail
end
