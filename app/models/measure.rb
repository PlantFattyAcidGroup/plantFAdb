class Measure < ActiveRecord::Base
  has_many :names
  has_many :systematic_names, dependent: :destroy
  has_many :trivial_names, dependent: :destroy
  has_many :results
  has_paper_trail
end
