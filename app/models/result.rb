class Result < ActiveRecord::Base
  belongs_to :measure
  belongs_to :publication
end
