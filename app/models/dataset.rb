class Dataset < ActiveRecord::Base
  belongs_to :dbxref
  belongs_to :plants_pub
  has_many :results
  validates :lipid_type, :plants_pub, presence: true
  validates :dbxref, presence: true, if: "dbxref_value.present?"
  
  scope :with_remarks, -> {where.not(remarks: nil)}
  has_paper_trail
  has_drafts
  def display_name
    s="#{id}: "
    s+="#{lipid_type} " if lipid_type.present?
  end
  
  def draft_publication_dependencies
    results.map(&:draft).compact
  end
  
  def draft_reversion_dependencies
    results.map(&:draft).compact
  end
  
  def total_percent(supplied_results=nil)
    r = supplied_results || self.results
    r.select{|r| r.measure.class == FattyAcid}.map(&:value).map(&:to_f).compact.sum.round(2)
  end
end