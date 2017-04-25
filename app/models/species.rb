class Species
  attr_accessor :genus, :species
  def initialize(genus, species)
    self.genus = genus.try(:downcase)||'-'
    self.species = species.try(:downcase)||'-'
  end
  
  def valid?
    plants.count > 0
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
  
  def family
    plants.map(&:family).compact.uniq.reject(&:blank?).join(",")
  end
  
  def order_name
    plants.map(&:order_name).compact.uniq.reject(&:blank?).join(",")
  end
  
  def results
    Result.joins(dataset:[plants_pub: [:plant]]).where(plants: {id: plants})
  end
  
  def plants
    plant_query = Plant.published
    plant_query = (genus == '-' ? plant_query.where('genus is null') : plant_query.where("lower(genus)=?",self.genus))
    plant_query = (species == '-' ? plant_query.where('species is null') : plant_query.where("lower(species)=?",self.species))
    @plants||=plant_query
  end
  
end