class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update, :destroy]

  # GET /names
  def index
    @names = Name.all.page params[:page]
    if(params[:query])
      @names = @names.where('
        type LIKE ?
        OR name LIKE ?
        OR measure_id LIKE ?',
        "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"
      )
    end
  end

  # GET /names/1
  def show
  end

  # GET /names/new
  def new
    @name = Name.new
  end

  # GET /names/1/edit
  def edit
  end

  # POST /names
  def create
    @name = Name.new(resource_params)

    if @name.save
      redirect_to @name, notice: 'Name was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /names/1
  def update
    if @name.update(resource_params)
      redirect_to @name, notice: 'Name was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /names/1
  def destroy
    @name.destroy
    redirect_to names_url, notice: 'Name was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @name = Name.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:name).permit(:type, :name, :measure_id)
    end
end
