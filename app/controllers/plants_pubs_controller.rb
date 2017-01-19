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
    [10027,10035,10046].each do |id|
      @result = @plants_pub.results.build(measure_id: id)
    end
    @results = []
  end
  
  def create
    @plants_pub.user_id = current_user.try(:id)
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
    
    ### Prefill measures
    default_measures = Measure.find([10027,10035,10046,10051,10066,10074,10077,10090,10114,10127,10131,10147,10152,10000])
    
    ### All measures from publication
    all_measures = @plants_pub.pub.plants_pubs.includes(results: [:measure]).map(&:results).flatten.map(&:measure).uniq
    
    ### Used measures from this publication-plant
    used_measures = @plants_pub.results.map(&:measure).uniq
    
    (default_measures-used_measures).each do |m|
      @results << @plants_pub.results.build(measure: m)
    end
    (all_measures-used_measures-default_measures).each do |m|
      @results << @plants_pub.results.build(measure: m)
    end
    
    @results = @results.sort_by{|r| r.measure.try(:delta_notation) || ''}
    
    5.times do |i|
      @results << @plants_pub.results.build
    end
    @total_percent = @results.select{|r| r.measure.class == FattyAcid}.map(&:value).compact.sum
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