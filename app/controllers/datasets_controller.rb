class DatasetsController < ApplicationController
  load_and_authorize_resource
  
  def show
    redirect_to [:edit,@dataset.plants_pub]
  end
  
  # GET /results/new
  def new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  def create
    if @dataset.draft_creation
      @dataset.plants_pub.attributes = {updated_at: Time.now}
      @dataset.plants_pub.draft_update
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id)
    else
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id), notice: 'Dataset could not be created.<br/>'+@dataset.errors.full_messages.join("<br/>")
    end
  end

  # PATCH/PUT /results/1
  def update
    @dataset.attributes = resource_params
    if @dataset.draft_update
      @dataset.plants_pub.attributes = {updated_at: Time.now}
      @dataset.plants_pub.draft_update
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id)
    else
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id), notice: 'Dataset could not be updated.<br/>'+@dataset.errors.full_messages.join("<br/>")
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
    params.require(:dataset).permit(:dbxref_id, :dbxref_value, :remarks, :notes, :plants_pub_id, :lipid_measure)
  end
end