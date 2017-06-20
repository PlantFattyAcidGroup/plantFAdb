class PlantsPubsController < ApplicationController  
  load_and_authorize_resource
  def show
    @plant = @plants_pub.plant
    @pub = @plants_pub.pub
    @results = @plants_pub.results.includes(:measure)
      .order(sort_column + ' ' + sort_direction)
      .viewable
      
    if @plants_pub.published?
      @results = @results.published
    end
    #@sofa_tabs = @results.map(&:publication).compact.map(&:sofa_tab_id).uniq
    @results = @results.page(params[:page])
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
    ### Prefill measures
    default_measures = Measure.find([10027,10035,10046,10051,10066,10074,10077,10090,10114,10127,10131,10147,10152,10000])
    
    ### All measures from publication
    #all_measures = PlantsPub.where(pub_id: @plants_pub.pub_id).includes(datasets: [results: :measure]).map(&:datasets).flatten.map(&:results).flatten.map(&:measure).uniq

    @datasets = @plants_pub.datasets.includes(results: [:measure]).references(results: [:measure])
    @results ={}
    @datasets.each do |d|
      @results[d.id] = d.results.to_a
      
      ### Used measures from this dataset
      used_measures = @results[d.id].map(&:measure).uniq
      
      (default_measures-used_measures).each do |m|
        @results[d.id] << d.results.build(measure: m)
      end
      # (all_measures-used_measures-default_measures).each do |m|
      #   @results[d.id] << d.results.build(measure: m)
      # end
      
      r_mol = @results[d.id].select{|r| r.measure.try(:sofa_mol_id).present?}.sort_by{|r| r.measure.sofa_mol_id}
      r_new = @results[d.id].reject{|r| r.measure.try(:sofa_mol_id).present?}.sort_by{|r| r.measure.try(:mass)||0}
      @results[d.id] = r_mol+r_new
    
      5.times do |i|
        @results[d.id] << d.results.build
      end      
    end
    @datasets << @plants_pub.datasets.build(lipid_measure: 'Total Oil')
  end
  
  def update
    if @plants_pub.update(resource_params)
      redirect_to @plants_pub, notice: 'Plant table successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    if @plants_pub.datasets.empty?
      @plants_pub.draft_destruction
      redirect_to pubs_url, notice: 'Table marked for destruction.'
    else
      redirect_to edit_plants_pub_path(@plants_pub), notice: "Publication table still contains data. You must remove all datasets before destroying the table"
    end
  end
  
  protected
  def sort_column
    col = ['measures.mass','unit','value','measures.delta_notation','measures.name', 'measures.type'].find{|c| c==params[:sort]}
    col || "measures.mass"
  end
  
  def resource_params
    params.require(:plants_pub).permit(:remarks, :notes, :plant_id, :pub_id)
  end
  
end