class Dataset < ActiveRecord::Base
  belongs_to :dbxref
  belongs_to :plants_pub
  has_many :results, autosave: true
  validates :plants_pub, presence: true
  validates :dbxref, presence: true, if: "dbxref_value.present?"
  
  scope :with_remarks, -> {where.not(remarks: nil)}
  has_paper_trail
  has_drafts
  def display_name
    s="#{id}: "
    s+="#{lipid_type} " if lipid_type.present?
    return s
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
  
  def method_missing(methId, *args)
     str = methId.id2name
     if m = str.match(/fa_(\d+)/)
       self.results.build(
         measure_id: m[1],
         value: args[0],
         unit: 'weight-%',
         published_at: Time.now
       )
     else
       super
     end     
  end
   
  def oil_content=(val)
    oc = Measure.where("upper(measures.delta_notation)='OIL CONTENT'").first
    return if oc.blank?
    if self.results.where(measure_id: oc.id).first
      self.results.each do |r|
        r.value = val if r.measure_id==oc.id
      end
    else
      self.results.build(measure_id: oc.id, value: val, unit: 'weight-%', published_at: Time.now)
    end
  end
end