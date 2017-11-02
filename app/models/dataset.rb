# == Schema Information
#
# Table name: datasets
#
#  id            :integer          not null, primary key
#  remarks       :string
#  notes         :string
#  lipid_type    :string
#  dbxref_value  :string
#  plants_pub_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  draft_id      :integer
#  published_at  :datetime
#  trashed_at    :datetime
#  dbxref_id     :integer
#  tissue        :string
#

class Dataset < ActiveRecord::Base
  belongs_to :dbxref
  belongs_to :plants_pub
  has_many :results, autosave: true, dependent: :destroy
  validates :plants_pub, presence: true
  validates :dbxref, presence: true, if: "dbxref_value.present?"
  
  delegate :plant_id, :pub_id, :plant, :pub, to: :plants_pub
  delegate :species, to: :plant
  scope :with_remarks, -> {where.not(remarks: nil)}
  has_paper_trail
  has_drafts
  
  def display_name
    ["##{id}",tissue,lipid_type].reject{|s| s=='-'}.compact.join(' | ')
  end
  
  def draft_publication_dependencies
    dependent_drafts = results.map(&:draft).compact
    pbd = plants_pub.draft
    dependent_drafts << pbd if draft.create? && pbd.try(:create?)
    return dependent_drafts
  end
  
  def draft_reversion_dependencies
    results.map(&:draft).compact
  end
  
  def total_percent(supplied_results=nil)
    r = supplied_results || self.results
    r.select{|r| r.measure.class == FattyAcid}.map(&:value).map(&:to_f).compact.sum.round(2)
  end
  
  def dbxref_name
    dbxref.try(:name)
  end
  def dbxref_name=(val)
    self.dbxref_id=Dbxref.find_or_create_by(name: val).id
  end
  
  def self.extra_download_columns
    ["","","","","","","","",""]+fa_ids.keys.map{|i| FattyAcid.find_by(id: i).try(:delta_notation)||'-'}
  end
  
  def self.fa_ids
    ::FattyAcid.pluck(:id).sort.map{|i| [i.to_s,'fa_'+i.to_s]}.to_h
  end
  
  def self.bulk_columns
    h = {
      "Plant ID" => :plant_id,
      "Pub ID" => :pub_id,
      "lipid type" => :lipid_type,
      "tissue" => :tissue,
      "DBXREF Name" => :dbxref_name,
      "DBXREF Value" => :dbxref_value,
      "remarks" => :remarks,
      "notes" => :notes,
      "oil content" => :oil_content
    }
    return h.merge(fa_ids)
  end
  
  def self.download_columns
    bulk_columns.merge ({
      "Total Results" => :result_count
    })
  end
  
  def method_missing(methId, *args)
     str = methId.id2name
     if m = str.match(/fa_(\d+)=/)
       self.results.build(
         measure_id: m[1],
         value: args[0],
         unit: 'weight-%',
         published_at: Time.now
       )
     elsif m = str.match(/fa_(\d+)/)
       res = self.results.select{|r| r.measure_id==m[1].to_i}.to_a
       r_size = res.length
       r_size > 0 ? (res.inject(0.0){|sum,r| sum+=r.value.to_f} / r_size.to_f) : 0
     else
       super
     end     
  end

  def oil_content
    oc = Measure.where("upper(measures.delta_notation)='OIL CONTENT'").first
    return nil if oc.blank?
    self.results.where(measure_id: oc.id).average(:value)
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
