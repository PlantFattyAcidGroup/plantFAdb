class PlantsPubsController < ApplicationController
  load_and_authorize_resource
  def show
    @plant = @plants_pub.plant
    @pub = @plants_pub.pub
    @results = Result.where(plant_id: @plant.id, pub_id: @pub.id)
      .order(sort_column + ' ' + sort_direction)
      .viewable
      .page(params[:page])
  end
  
  def edit
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
    params[:sort] || "results.value"
  end
  
  def resource_params
    params.require(:plants_pub).permit(:remarks, :notes)
  end
  
end