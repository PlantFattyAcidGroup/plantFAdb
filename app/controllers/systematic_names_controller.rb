class SystematicNamesController < ApplicationController
  before_action :set_systematic_name, only: [:show, :edit, :update, :destroy]

  # GET /systematic_names
  def index
    @systematic_names = SystematicName.all.page params[:page]
    if(params[:query])
      @systematic_names = @systematic_names.where('
        name LIKE ?',
        "%#{params[:query]}%"
      )
    end
  end

  # GET /systematic_names/1
  def show
  end

  # GET /systematic_names/new
  def new
    @systematic_name = SystematicName.new
  end

  # GET /systematic_names/1/edit
  def edit
  end

  # POST /systematic_names
  def create
    @systematic_name = SystematicName.new(resource_params)

    if @systematic_name.save
      redirect_to @systematic_name, notice: 'Systematic name was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /systematic_names/1
  def update
    if @systematic_name.update(resource_params)
      redirect_to @systematic_name, notice: 'Systematic name was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /systematic_names/1
  def destroy
    @systematic_name.destroy
    redirect_to systematic_names_url, notice: 'Systematic name was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_systematic_name
      @systematic_name = SystematicName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:systematic_name).permit(:name)
    end
end
