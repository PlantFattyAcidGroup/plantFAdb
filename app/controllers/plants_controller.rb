class PlantsController < ApplicationController
  require "unicode_utils/upcase"
  load_and_authorize_resource
  # GET /plants
  def index
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /.*sqlite.*/
      @plants = @plants.order(sort_column + ' ' + sort_direction+", id asc")
    else
      @plants = @plants.order(sort_column + ' ' + sort_direction+" nulls last, id asc")
    end
    
    result_count = Result.viewable.published
                         .joins(:measure, dataset: [plants_pub: [:plant, :pub]])
                         .group("plants.id")
                         .select("count(distinct(results.id)) result_count, count(distinct(pubs.id)) pub_count, plants.id plant_id")
    
    oil_content = Result.viewable.published
                        .joins(:measure, dataset: [plants_pub: [:plant]])
                        .where("upper(measures.delta_notation)='OIL CONTENT'")
                        .group("plants.id")
                        .select("avg(results.value) avg_oil_content, plants.id plant_id")
    
    @plants = @plants.published
                     .joins("left outer join (#{result_count.to_sql}) res on res.plant_id = plants.id")
                     .joins("left outer join (#{oil_content.to_sql}) oil_res on oil_res.plant_id = plants.id")
                     .select("plants.*, res.pub_count, res.result_count, oil_res.avg_oil_content")

    if(params[:query].present?)
      q = UnicodeUtils.upcase(params[:query])
      @plants = @plants.where('
        upper(sofa_name) LIKE :q
        OR upper(note) LIKE :q
        OR upper(sofa_family) LIKE :q
        OR upper(order_name) LIKE :q
        OR upper(family) LIKE :q
        OR upper(genus) LIKE :q
        OR upper(species) LIKE :q
        OR upper(tnrs_family) LIKE :q
        OR upper(tnrs_name) LIKE :q
        OR upper(common_name) LIKE :q
        OR upper(variety) LIKE :q
        OR upper(authority) LIKE :q
        OR upper(tnrs_name_submitted) LIKE :q
        OR upper(genus || \' \' || species) LIKE :q',
        {q: "%#{q}%"}
      )
    end
    if params[:genus].present? && params[:species].present?
      @species = Species.new(params[:genus],params[:species])
      @plants = @plants.where(id: @species.plants)
    end

    respond_to do |format|
      # Base html query
      format.html{ @plants = @plants.page(params[:page])}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["ID"]+Plant.download_columns.keys.map(&:titleize))
          @plants.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              (can? :edit, item) ? "=HYPERLINK(\"#{root_url}js_redirect.html?page=#{edit_plant_path(item.id)}\",\"#{item.id}\")" : item.id
            ]+Plant.download_columns.map{|k,v| item.send(v)})
          end
        end
      }
    end
  end

  # GET /plants/1
  def show
    @fatty_acid_data = {}
    @parameter_data = {}
    @results = @plant.results.includes(:measure).order("measures.delta_notation").where(unit: ['GLC-Area-%','weight-%'])
    @results.where("measures.type = 'FattyAcid'").each do |result|
      next unless result.unit == 'GLC-Area-%' || result.unit == 'weight-%'
      @fatty_acid_data[result.measure_id]||={object:result.measure,values:[]}
      @fatty_acid_data[result.measure_id][:values]<<result.value.to_f.round(2)
    end
    @fatty_acid_data = @fatty_acid_data.map{|k,v| v}
    @results.where("measures.type = 'Parameter'").each do |result|
      @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]||=[]
      @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]<<result.value.to_f.round(2)
    end
  end

  # GET /plants/new
  def new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  def create
    @plant.user_id = current_user.try(:id)
    if @plant.save_draft
      redirect_to @plant, notice: 'A draft of the new Plant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plants/1
  def update
    @plant.attributes = resource_params
    if @plant.save_draft
      redirect_to [:edit,@plant], notice: 'A draft of the Plant update was saved successfully.'
    else
      render :edit
    end
  end

  # DELETE /plants/1
  def destroy
    if @plant.plants_pubs.empty?  
      @plant.draft_destruction
      redirect_to plants_url, notice: 'Plant marked for destruction.'
    else
      redirect_to plants_url, notice: 'Plant still has data. You must move or delete all publication tables referencing this plant first.'
    end
  end
  
  def autocomplete_plant_name
    q = UnicodeUtils.upcase(params[:term]||'')
    plants = Plant.where('
        upper(sofa_name) LIKE ?
        OR upper(sofa_family) LIKE ?
        OR upper(sofa_family || \' \' || sofa_name) LIKE ?
        OR upper(genus) LIKE ?
        OR upper(species) LIKE ?
        OR upper(tnrs_family) LIKE ?
        OR upper(tnrs_name) LIKE ?
        OR upper(tnrs_family || \' \' || tnrs_name) LIKE ?
        OR upper(common_name) LIKE ?
        OR upper(variety) LIKE ?
        OR upper(genus || \' \' || species) LIKE ?
        OR upper(family || \' \' || genus || \' \' || species) LIKE ?
        OR upper(order_name || \' \' || family || \' \' || genus || \' \' || species) LIKE ?',
        "#{q}%","#{q}%","#{q}%", "#{q}%", "#{q}%", "#{q}%", "#{q}%","#{q}%", "#{q}%", "#{q}%", "#{q}%", "#{q}%", "#{q}%"
      )
    .order('genus, species, sofa_name').limit(15)
    render :json => plants.map { |plant| {:id => plant.id, :label => plant.autocomplete_name, :value => plant.display_name} }
  end
  
  private
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:plant).permit(:common_name, :tnrs_family, :tnrs_name, :accepted_rank, :name_status, :matched_rank, :order_name, :family, :genus, :species, :tropicos_url, :note, :variety, :tissue)
    end
    
    def sort_column
      col = ['genus','species', 'common_name', 'family', 'order_name','avg_oil_content','pub_count', 'result_count', 'variety'].find{|c| c==params[:sort]}
      col || "plants.genus, plants.species"
    end
end
