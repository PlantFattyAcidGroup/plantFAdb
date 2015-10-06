class Result < ActiveRecord::Base
  belongs_to :measure
  belongs_to :publication
  belongs_to :pub
  belongs_to :plant
  has_paper_trail
end
