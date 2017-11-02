class SpeciesController < ApplicationController
  skip_authorization_check
  
  def index
    oil_content = Parameter.where("upper(delta_notation)='OIL CONTENT'").first
    @species = Plant.all
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /.*sqlite.*/
      @species = @species.order(sort_column + ' ' + sort_direction+", plants.genus asc, plants.species asc")
    else
      @species = @species.order(sort_column + ' ' + sort_direction+" nulls last, plants.genus asc, plants.species asc")
    end
                       
    @species = @species.joins(plants_pubs: [:pub, datasets: [results: :measure]])
                       .joins("left outer join results oil_res on oil_res.dataset_id = datasets.id and oil_res.measure_id = #{oil_content.id}")
                       .where("results.unit in ('GLC-Area-%','weight-%')")
                       .where("measures.type in ('FattyAcid','Parameter')")
                       .where("plants.published_at IS NOT NULL")
                       .where("pubs.published_at IS NOT NULL")
                       .where("results.published_at IS NOT NULL")
                      
      
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
    @species = @species.group([:genus, :species]).page(params[:page])
                        .select("plants.genus, plants.species,
                                avg(oil_res.value) avg_oil_content,
                                count(distinct(pubs.id)) pub_count,
                                count(distinct(results.id)) result_count,
                                count(distinct(plants.id)) plant_count"
                               )
    
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
        #@parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]<<result.value.round(2)
        @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"] << {id: result.id, value: result.value.round(2)}
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