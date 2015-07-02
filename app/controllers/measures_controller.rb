class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  # GET /measures
  def index
    @measures = Measure.all.page params[:page]
    if(params[:query])
      @measures = @measures.where('
        type LIKE ?
        OR delta_notation LIKE ?
        OR cas_number LIKE ?
        OR sofa_mol_id LIKE ?',
        "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"
      )
    end
  end

  # GET /measures/1
  def show
  end

  # GET /measures/new
  def new
    @measure = Measure.new
  end

  # GET /measures/1/edit
  def edit
  end

  # POST /measures
  def create
    @measure = Measure.new(resource_params)

    if @measure.save
      redirect_to @measure, notice: 'Measure was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /measures/1
  def update
    if @measure.update(resource_params)
      redirect_to @measure, notice: 'Measure was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /measures/1
  def destroy
    @measure.destroy
    redirect_to measures_url, notice: 'Measure was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:measure).permit(:type, :delta_notation, :cas_number, :sofa_mol_id)
    end
end
