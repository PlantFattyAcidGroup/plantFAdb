class PlantsPubsController < ApplicationController  
  load_and_authorize_resource
  def show
    @plant = @plants_pub.plant
    @pub = @plants_pub.pub
    @results = @plants_pub.results.includes(:measure)
      .order(sort_column + ' ' + sort_direction)
      .page(params[:page]).viewable
      
    if @plants_pub.published?
      @results = @results.published
    end
  end
  
  def new
    @plants_pub.pub = Pub.find(params[:pub_id])
    @pub = @plants_pub.pub || Pub.new
    @result = @plants_pub.results.build
    @results = []
  end
  
  def create
    if @plants_pub.draft_creation
      redirect_to edit_plants_pub_path(@plants_pub), notice: 'A draft of the new Plant table was successfully created.'
    else
      @pub = @plants_pub.pub || Pub.new
      @result = @plants_pub.results.build
      @results = []
      render :new
    end
  end
  
  def edit
    @results = @plants_pub.results.page(params[:page]).includes(:measure)
    if params[:sort].blank?
      @results = @results.order(created_at: :desc)
    else
      @results = @results.order(sort_column + ' ' + sort_direction)
    end
    all_measures = @plants_pub.pub.plants_pubs.includes(results: [:measure]).map(&:results).flatten.map(&:measure).uniq
    used_measures = @plants_pub.results.includes(:measure).map(&:measure).uniq
    measure = (all_measures-used_measures).first
    @result = @plants_pub.results.build(measure: measure)
  end
  
  def update
    if @plants_pub.update(resource_params)
      redirect_to @plants_pub, notice: 'Plant table successfully updated.'
    else
      render :edit
    end
  end
  
  protected
  def sort_column
    ['measures.mass','unit','value','measures.delta_notation','measures.name', 'measures.type'].find{|c| c==params[:sort]} || "measures.mass"
  end
  
  def resource_params
    params.require(:plants_pub).permit(:remarks, :notes, :plant_id, :pub_id)
  end
  
end