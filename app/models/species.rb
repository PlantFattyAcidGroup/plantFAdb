class Species
  attr_accessor :genus, :species
  def initialize(genus,species)
    self.genus=genus.downcase
    self.species = species.downcase
  end
  
  def id
    "#{genus}_#{species}"
  end
  
  def name
    "#{genus.capitalize} #{species}"
  end
  
  def common_name
    plants.map(&:common_name).uniq.reject(&:blank?).join(",")
  end
  
  def name_and_common_name
    s = name
    if common_name
      s+=" - #{common_name}"
    end
    return s
  end
  
  def plants
    @plants||=Plant.where("lower(genus)=? AND lower(species)=?", self.genus, self.species)
  end
  
  def results
    Result.joins(dataset:[plants_pub: [:plant]]).where(plants: {id: plants})
  end
  
  def valid?
    plants.count > 0
  end
  
  def family
    plants.map(&:family).compact.uniq.reject(&:blank?).join(",")
  end
  
  def order_name
    plants.map(&:order_name).compact.uniq.reject(&:blank?).join(",")
  end
  
end