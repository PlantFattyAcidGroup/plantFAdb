class TrivialNamesController < ApplicationController
  before_action :set_trivial_name, only: [:show, :edit, :update, :destroy]

  # GET /trivial_names
  def index
    @trivial_names = TrivialName.all.page params[:page]
    if(params[:query])
      @trivial_names = @trivial_names.where('
        name LIKE ?',
        "%#{params[:query]}%"
      )
    end
  end

  # GET /trivial_names/1
  def show
  end

  # GET /trivial_names/new
  def new
    @trivial_name = TrivialName.new
  end

  # GET /trivial_names/1/edit
  def edit
  end

  # POST /trivial_names
  def create
    @trivial_name = TrivialName.new(resource_params)

    if @trivial_name.save
      redirect_to @trivial_name, notice: 'Trivial name was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trivial_names/1
  def update
    if @trivial_name.update(resource_params)
      redirect_to @trivial_name, notice: 'Trivial name was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trivial_names/1
  def destroy
    @trivial_name.destroy
    redirect_to trivial_names_url, notice: 'Trivial name was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trivial_name
      @trivial_name = TrivialName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:trivial_name).permit(:name)
    end
end
