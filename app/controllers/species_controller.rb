class SpeciesController < ApplicationController
  skip_authorization_check
  
  def index
    oil_content = Parameter.where("upper(delta_notation)='OIL CONTENT'").first
    @species = Plant.group([:genus,:species])
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /.*sqlite.*/
      @species = @species.order(sort_column + ' ' + sort_direction+", id asc")
    else
      @species = @species.order(sort_column + ' ' + sort_direction+" nulls last, id asc")
    end
    
    @species = @species.joins("left outer join (
      select avg(r.value) avg_oil_content, p.genus oil_genus, p.species oil_species from results r left outer join plants_pubs pl_tbl on pl_tbl.id = r.plants_pub_id left outer join plants p on pl_tbl.plant_id = p.id where r.measure_id = #{oil_content.id} group by p.genus, p.species
    ) oil_res on oil_res.oil_genus = plants.genus and oil_res.oil_species = plants.species ")
    .joins("left outer join (select count(distinct(p.pub_id)) pub_count, l.genus pub_genus, l.species pub_species from plants_pubs p join pubs on pubs.id = p.pub_id left outer join plants l on p.plant_id = l.id where pubs.published_at IS NOT NULL group by l.genus, l.species) pub on pub.pub_genus = plants.genus and pub.pub_species = plants.species ")
    .joins("left outer join (select count(r.id) result_count, l.genus res_genus, l.species res_species from results r left outer join plants_pubs pl_tbl on pl_tbl.id = r.plants_pub_id left outer join plants l on pl_tbl.plant_id = l.id left outer join measures m on m.id = r.measure_id where unit in ('GLC-Area-%','weight-%') AND m.type in ('FattyAcid','Parameter') group by l.genus, l.species) res on res.res_genus = plants.genus and res.res_species = plants.species ")
    .where.not(genus: nil)
    .where.not(species: nil)
    .page(params[:page])
    .select("plants.*, pub.pub_count, res.result_count, oil_res.avg_oil_content")
    
    if(params[:query])
      q = UnicodeUtils.upcase(params[:query])
      @species = @species.where('
        upper(sofa_name) LIKE ?
        OR upper(note) LIKE ?
        OR upper(sofa_family) LIKE ?
        OR upper(order_name) LIKE ?
        OR upper(family) LIKE ?
        OR upper(genus) LIKE ?
        OR upper(species) LIKE ?
        OR upper(tnrs_family) LIKE ?
        OR upper(tnrs_name) LIKE ?
        OR upper(common_name) LIKE ?
        OR upper(variety) LIKE ?
        OR upper(genus || \' \' || species) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
    #@plants = @plants.published
    respond_to do |format|
      # Base html query
      format.html{ @species = @species.page params[:page]}
    end
  end
  
  def show
    @species = Species.new(params[:genus],params[:species])
    if @species.valid?
      @fatty_acid_data = {}
      @parameter_data = {}
      @results = @species.results.includes(:measure).order("measures.delta_notation").where(unit: ['GLC-Area-%','weight-%'])
      @results.where("measures.type = 'FattyAcid'").each do |result|
        next unless result.unit == 'GLC-Area-%' || result.unit == 'weight-%'
        @fatty_acid_data[result.measure_id]||={object:result.measure,values:[]}
        @fatty_acid_data[result.measure_id][:values]<<result.value.to_f.round(2)
      end
      @fatty_acid_data = @fatty_acid_data.map{|k,v| v}
      @results.where("measures.type = 'Parameter'").each do |result|
        @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]||=[]
        @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]<<result.value.round(2)
      end
    else
      redirect_to root_path
    end
  end
  
  private
  def sort_column
    col = ['genus','species', 'common_name', 'family', 'order_name','avg_oil_content','pub_count', 'result_count'].find{|c| c==params[:sort]}
    col || "plants.genus, plants.species"
  end
end