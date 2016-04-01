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
      @selected = FattyAcid.find_by(id: params[:measure]) if params[:measure]
      @min = nil
      @max = 0
      @tree = TreeNode.arrange_serializable(:order => :id) do |parent, children|
        if children.empty?
          if params[:measure].blank?
            v1 = Result.joins(:measure, :plant)
            .where("measures.type ='FattyAcid'")
            .where("plants.order_name='#{parent.name}'")
            .count
          else
            v1 = Result.joins(:measure, :plant)
            .where("measures.id = ?", params[:measure])
            .where("plants.order_name = '#{parent.name}'")
            .maximum(:value).to_f.try(:round,3)
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
          out << CSV.generate_line(["Family","Name","Publication Count","Result Count"])
          @plants.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.family,
              item.name,
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
      params.require(:plant).permit(:tnrs_family, :tnrs_name, :accepted_rank, :name_status, :matched_rank, :family, :genus, :species, :tropicos_url, :note)
    end
    
    def sort_column
      params[:sort] || "plants.genus, plants.species"
    end
end
