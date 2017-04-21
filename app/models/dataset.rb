class Dataset < ActiveRecord::Base
  belongs_to :dbxref
  belongs_to :plants_pub
  has_many :results
  validates :lipid_measure, presence: true
  validates :dbxref, presence: true, if: "dbxref_value.present?"
  
  scope :with_remarks, -> {where.not(remarks: nil)}
  has_paper_trail
  has_drafts
  def display_name
    "Dataset #{id} - #{dbxref.try(:name)}: #{dbxref_value} (#{lipid_measure})"
  end
  
  def draft_publication_dependencies
    results.map(&:draft).compact
  end
  
  def draft_reversion_dependencies
    results.map(&:draft).compact
  end
  
  def total_percent
    results.select{|r| r.measure.class == FattyAcid}.map(&:value).compact.sum
  end
  
end