class SterolsController < ApplicationController
  before_action :set_sterol, only: [:show, :edit, :update, :destroy]

  # GET /sterols
  def index
    @sterols = Sterol.includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
    .page params[:page]
    if(params[:query])
      q = params[:query].upcase
      @sterols = @sterols.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR upper(delta_notation) LIKE ?
        OR upper(sofa_mol_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%"
      )
    end
  end

  # GET /sterols/1
  def show
  end

  # GET /sterols/new
  def new
    @sterol = Sterol.new
  end

  # GET /sterols/1/edit
  def edit
  end

  # POST /sterols
  def create
    @sterol = Sterol.new(resource_params)

    if @sterol.save
      redirect_to @sterol, notice: 'Sterol was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sterols/1
  def update
    if @sterol.update(resource_params)
      redirect_to @sterol, notice: 'Sterol was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sterols/1
  def destroy
    @sterol.destroy
    redirect_to sterols_url, notice: 'Sterol was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sterol
      @sterol = Sterol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:sterol).permit(:delta_notation, :cas_number, :sofa_mol_id)
    end
end
