class SpeciesController < ApplicationController
  skip_authorization_check
  
  def index
    oil_content = Parameter.where("upper(delta_notation)='OIL CONTENT'").first
    @species = Plant.all
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /.*sqlite.*/
      @species = @species.order(sort_column + ' ' + sort_direction+", id asc")
    else
      @species = @species.order(sort_column + ' ' + sort_direction+" nulls last, plants.genus asc, plants.species asc")
    end
    
    @species = @species.joins("left outer join (
      select count(r.id) result_count, p.id plant_id
      from results r
        left outer join datasets d on r.dataset_id = d.id
        left outer join plants_pubs pl_tbl on pl_tbl.id = d.plants_pub_id
        left outer join plants p on pl_tbl.plant_id = p.id
        left outer join measures m on m.id = r.measure_id
        where unit in ('GLC-Area-%','weight-%') AND m.type in ('FattyAcid','Parameter')
        group by p.id
    ) res on res.plant_id = plants.id")
    .joins("left outer join (
      select avg(r.value) avg_oil_content, p.id plant_id
      from results r
        left outer join datasets d on r.dataset_id = d.id
        left outer join plants_pubs pl_tbl on pl_tbl.id = d.plants_pub_id
        left outer join plants p on pl_tbl.plant_id = p.id
        where r.measure_id = #{oil_content.id}
        group by p.id
    ) oil_res on oil_res.plant_id = plants.id")
    .joins("left outer join (
      select count(distinct(p.pub_id)) pub_count, l.id plant_id
      from plants_pubs p
        join pubs on pubs.id = p.pub_id
        left outer join plants l on p.plant_id = l.id
        where pubs.published_at IS NOT NULL
        group by l.id
      ) pub on pub.plant_id = plants.id")
      
    if(params[:query])
      q = UnicodeUtils.upcase(params[:query])
      @species = @species.where('
        upper(plants.sofa_name) LIKE ?
        OR upper(plants.note) LIKE ?
        OR upper(plants.sofa_family) LIKE ?
        OR upper(plants.order_name) LIKE ?
        OR upper(plants.family) LIKE ?
        OR upper(plants.genus) LIKE ?
        OR upper(plants.species) LIKE ?
        OR upper(plants.tnrs_family) LIKE ?
        OR upper(plants.tnrs_name) LIKE ?
        OR upper(plants.common_name) LIKE ?
        OR upper(plants.variety) LIKE ?
        OR upper(plants.genus || \' \' || plants.species) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
    @species = @species.group([:genus, :species])
                       .select("plants.genus, plants.species, count(plants.id) plant_count, avg(oil_res.avg_oil_content) avg_oil_content, sum(pub.pub_count) pub_count, sum(res.result_count) result_count")
                       .page(params[:page])
    respond_to do |format|
      # Base html query
      format.html{}
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
    col = ['genus','species','plant_count','avg_oil_content','pub_count', 'result_count'].find{|c| c==params[:sort]}
    col || 'plants.genus, plants.species'
  end
end