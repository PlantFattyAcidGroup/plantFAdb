class TocopherolsController < ApplicationController
  before_action :set_tocopherol, only: [:show, :edit, :update, :destroy]

  # GET /tocopherols
  def index
    @tocopherols = Tocopherol.includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
    .page params[:page]
    if(params[:query])
      q = params[:query].upcase
      @tocopherols = @tocopherols.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR upper(delta_notation) LIKE ?
        OR upper(sofa_mol_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%"
      )
    end
  end

  # GET /tocopherols/1
  def show
  end

  # GET /tocopherols/new
  def new
    @tocopherol = Tocopherol.new
  end

  # GET /tocopherols/1/edit
  def edit
  end

  # POST /tocopherols
  def create
    @tocopherol = Tocopherol.new(resource_params)

    if @tocopherol.save
      redirect_to @tocopherol, notice: 'Tocopherol was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tocopherols/1
  def update
    if @tocopherol.update(resource_params)
      redirect_to @tocopherol, notice: 'Tocopherol was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tocopherols/1
  def destroy
    @tocopherol.destroy
    redirect_to tocopherols_url, notice: 'Tocopherol was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tocopherol
      @tocopherol = Tocopherol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:tocopherol).permit(:delta_notation, :cas_number, :sofa_mol_id)
    end
end
