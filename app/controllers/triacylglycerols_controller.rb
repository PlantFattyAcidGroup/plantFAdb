class TriacylglycerolsController < ApplicationController
  before_action :set_triacylglycerol, only: [:show, :edit, :update, :destroy]

  # GET /triacylglycerols
  def index
    @triacylglycerols = Triacylglycerol.includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
    .page params[:page]
    if(params[:query])
      q = params[:query].upcase
      @triacylglycerols = @triacylglycerols.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR upper(delta_notation) LIKE ?
        OR upper(sofa_mol_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%"
      )
    end
  end

  # GET /triacylglycerols/1
  def show
  end

  # GET /triacylglycerols/new
  def new
    @triacylglycerol = Triacylglycerol.new
  end

  # GET /triacylglycerols/1/edit
  def edit
  end

  # POST /triacylglycerols
  def create
    @triacylglycerol = Triacylglycerol.new(resource_params)

    if @triacylglycerol.save
      redirect_to @triacylglycerol, notice: 'Triacylglycerol was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /triacylglycerols/1
  def update
    if @triacylglycerol.update(resource_params)
      redirect_to @triacylglycerol, notice: 'Triacylglycerol was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /triacylglycerols/1
  def destroy
    @triacylglycerol.destroy
    redirect_to triacylglycerols_url, notice: 'Triacylglycerol was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_triacylglycerol
      @triacylglycerol = Triacylglycerol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:triacylglycerol).permit(:delta_notation, :cas_number, :sofa_mol_id)
    end
end
