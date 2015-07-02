class ParametersController < ApplicationController
  before_action :set_parameter, only: [:show, :edit, :update, :destroy]

  # GET /parameters
  def index
    @parameters = Parameter.includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
    .page params[:page]
    if(params[:query])
      q = params[:query].upcase
      @parameters = @parameters.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR upper(delta_notation) LIKE ?
        OR upper(sofa_mol_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%"
      )
    end
  end

  # GET /parameters/1
  def show
  end

  # GET /parameters/new
  def new
    @parameter = Parameter.new
  end

  # GET /parameters/1/edit
  def edit
  end

  # POST /parameters
  def create
    @parameter = Parameter.new(resource_params)

    if @parameter.save
      redirect_to @parameter, notice: 'Parameter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parameters/1
  def update
    if @parameter.update(resource_params)
      redirect_to @parameter, notice: 'Parameter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parameters/1
  def destroy
    @parameter.destroy
    redirect_to parameters_url, notice: 'Parameter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter
      @parameter = Parameter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:parameter).permit(:delta_notation, :cas_number, :sofa_mol_id)
    end
end
