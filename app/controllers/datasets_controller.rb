class DatasetsController < ApplicationController
  load_and_authorize_resource
  
  def show
    redirect_to edit_dataset_path @dataset
  end
  
  # GET /results/new
  def new
  end

  # GET /results/1/edit
  def edit
    default_measures = Measure.find([10027,10035,10046,10051,10066,10074,10077,10090,10114,10127,10131,10147,10152,10000])
    
    @results = @dataset.results.to_a    
    ### Used measures from this dataset
    used_measures = @results.map(&:measure).uniq
    
    (default_measures-used_measures).each do |m|
      @results << @dataset.results.build(measure: m)
    end
    
    r_mol = @results.select{|r| r.measure.try(:sofa_mol_id).present?}.sort_by{|r| r.measure.sofa_mol_id}
    r_new = @results.reject{|r| r.measure.try(:sofa_mol_id).present?}.sort_by{|r| r.measure.try(:mass)||0}
    @results = r_mol+r_new
  
    5.times do |i|
      @results << @dataset.results.build
    end
  end

  # POST /results
  def create
    if @dataset.draft_creation
      @dataset.plants_pub.attributes = {updated_at: Time.now}
      @dataset.plants_pub.draft_update
      redirect_to edit_dataset_path(@dataset)
    else
      render :new
    end
  end

  # PATCH/PUT /results/1
  def update
    @dataset.attributes = resource_params
    if @dataset.draft_update
      @dataset.plants_pub.attributes = {updated_at: Time.now}
      @dataset.plants_pub.draft_update
      redirect_to edit_dataset_path(@dataset)
    else
      render :edit
    end
  end

  # DELETE /results/1
  def destroy
    if @dataset.draft_destruction
      @dataset.plants_pub.attributes = {updated_at: Time.now}
      @dataset.plants_pub.draft_update
      @dataset.results.each do |r|
        r.draft_destruction
      end
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id), notice: 'Dataset removed.'
    else
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id), notice: 'Error removing dataset.'
    end
  end
  
  private
  
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:dataset).permit(:dbxref_id, :dbxref_value, :remarks, :notes, :plants_pub_id, :lipid_type, :tissue)
  end
end