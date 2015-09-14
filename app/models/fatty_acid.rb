class FattyAcid < Measure
  scope :with_results, -> { 
    joins("left outer join (select count(r.id) result_count, m.id measure_id from results r left outer join measures m on r.measure_id = m.id group by m.id) res on res.measure_id = measures.id ")
    .where("res.result_count is not null")
  } 
  scope :without_results, -> { 
    joins("left outer join (select count(r.id) result_count, m.id measure_id from results r left outer join measures m on r.measure_id = m.id group by m.id) res on res.measure_id = measures.id ")
    .where("res.result_count is null")
  }
  
  def name_with_count
    "#{name||systematic_names.first.try(:name)} (#{results.count})"
  end
end
