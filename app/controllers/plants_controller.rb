class PlantsController < ApplicationController
  load_and_authorize_resource
  # GET /plants
  def index
    @plants = @plants.order(sort_column + ' ' + sort_direction+", id asc")
    .joins("left outer join (select count(p.id) pub_count, l.id plant_id from plants_pubs p left outer join plants l on p.plant_id = l.id group by l.id) pub on pub.plant_id = plants.id ")
    .joins("left outer join (select count(r.id) result_count, l.id plant_id from results r left outer join plants l on r.plant_id = l.id group by l.id) res on res.plant_id = plants.id ")
    .page(params[:page])
    .select("plants.*, pub.pub_count, res.result_count")
    if(params[:query])
      q = params[:query].upcase
      @plants = @plants.where('
        upper(sofa_name) LIKE ?
        OR upper(note) LIKE ?
        OR upper(sofa_family) LIKE ?
        OR upper(order_name) LIKE ?
        OR upper(family) LIKE ?
        OR upper(genus) LIKE ?
        OR upper(species) LIKE ?
        OR upper(tnrs_family) LIKE ?
        OR upper(tnrs_name) LIKE ?',
        "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
    unless params[:status].blank?
      @plants = @plants.where(name_status: params[:status])
    end
    unless params[:accepted_rank].blank?
      @plants = @plants.where(accepted_rank: params[:accepted_rank])
    end
    unless params[:matched_rank].blank?
      @plants = @plants.where(matched_rank: params[:matched_rank])
    end
    if params[:fmt] == 'tree'
      @format_partial = 'tree'
    else
      @format_partial = 'listing'
    end
    if @format_partial == 'tree'
      @fatty_acids = FattyAcid.with_results.order("measures.name asc")
      @selected = FattyAcid.find_by(id: params[:measure_id]) if params[:measure_id]
      @min = nil
      @max = 0
      @tree = TreeNode.arrange_serializable(:order => :id) do |parent, children|
        if children.empty?
          if params[:measure_id].blank?
            v1 = Result.joins(:measure, :plant)
            .where("measures.type ='FattyAcid'")
            .where("plants.order_name='#{parent.name}'")
            .count
          else
            v1 = Result.joins(:measure, :plant)
            .where("measures.id = ?", params[:measure_id])
            .where("plants.order_name = '#{parent.name}'")
            .maximum(:value).to_f.try(:round,4)
          end
          v1||=0
          # get leaf stats
          @min||=v1
          @max=v1 if v1 > @max
          @min=v1 if v1 < @min
        else
          v1 = 1
        end
        {
          id: parent.id,
          name: parent.name,
          common_name: parent.common_name,
          #value: Plant.where(order_name: parent.name).count,
          v1: v1,
          children: children
        }
      end
    end
    respond_to do |format|
      # Base html query
      format.html{ @plants = @plants.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["ID","Common Name","Genus", "Species", "Family", "Order", "Tropicos URL", "Note",
            "TNRS Family", "TNRS Name", "Accepted Rank", "Matched Rank", "Name Status",
            "SOFA Family", "SOFA Name",
            "Publication Count","Result Count"])
          @plants.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              (can? :edit, item) ? "=HYPERLINK(\"#{root_url}js_redirect.html?page=#{edit_plant_path(item.id)}\",\"#{item.id}\")" : item.id,
              item.common_name,
              item.genus,
              item.species,
              item.family,
              item.order_name,
              item.tropicos_url,
              item.note,
              item.tnrs_family,
              item.tnrs_name,
              item.accepted_rank,
              item.matched_rank,
              item.name_status,
              item.sofa_family,
              item.sofa_name,
              item.pub_count,
              item.result_count
            ])
          end
        end
      }
    end
  end

  # GET /plants/1
  def show
    @fatty_acid_data = {}
    @parameter_data = {}
    @results = @plant.results.includes(:measure).order("measures.delta_notation")
    @results.where("measures.type = 'FattyAcid'").each do |result|
      next unless result.unit == 'GLC-Area-%' || result.unit == 'weight-%'
      @fatty_acid_data[result.measure_id]||={object:result.measure,values:[]}
      @fatty_acid_data[result.measure_id][:values]<<result.value.round(2)
    end
    @fatty_acid_data = @fatty_acid_data.map{|k,v| v}
    @results.where("measures.type = 'Parameter'").each do |result|
      @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]||=[]
      @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]<<result.value.round(2)
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
    if @plant.save
      redirect_to @plant, notice: 'Plant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plants/1
  def update
    if @plant.update(resource_params)
      redirect_to [:edit,@plant], notice: 'Plant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plants/1
  def destroy
    @plant.destroy
    redirect_to plants_url, notice: 'Plant was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:plant).permit(:common_name, :tnrs_family, :tnrs_name, :accepted_rank, :name_status, :matched_rank, :family, :genus, :species, :tropicos_url, :note)
    end
    
    def sort_column
      params[:sort] || "plants.genus, plants.species"
    end
end
