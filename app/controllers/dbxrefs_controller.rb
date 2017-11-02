class DbxrefsController < ApplicationController
  before_action :set_dbxref, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /dbxrefs
  def index
    @dbxrefs = Dbxref.all
  end

  # GET /dbxrefs/1
  def show
  end

  # GET /dbxrefs/new
  def new
    @dbxref = Dbxref.new
  end

  # GET /dbxrefs/1/edit
  def edit
  end

  # POST /dbxrefs
  def create
    @dbxref = Dbxref.new(resource_params)
    if @dbxref.save
      redirect_to dbxrefs_url, notice: 'Dbxref was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dbxrefs/1
  def update
    if @dbxref.update(resource_params)
      redirect_to @dbxref, notice: 'Dbxref was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dbxrefs/1
  def destroy
    if @dbxref.datasets.count == 0
      @dbxref.destroy
      redirect_to dbxrefs_url, notice: 'Dbxref was successfully destroyed.'
    else
      redirect_to dbxrefs_url, notice: 'Dbxref has associated datasets and cannot be removed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dbxref
      @dbxref = Dbxref.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:dbxref).permit(:name, :description, :link)
    end
end
