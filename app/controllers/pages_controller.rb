class PagesController < ApplicationController
  load_and_authorize_resource
  before_filter :load_static_pages
  # GET /pages
  def index
    @pages = @pages
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
  end

  # GET /pages/1/edit
  def edit
    if(@page.content)
      @page.content.gsub!("><",">\n<")
    end
  end

  # POST /pages
  def create
    @page = Page.new(resource_params)
    if @page.save
      redirect_to pages_path, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(resource_params)
      redirect_to pages_path, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    if @static_pages.exclude?(@page.title)
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    else
      redirect_to pages_url, error: 'Cannot destroy static page'
    end
  end

  private
    
    def load_static_pages
      @static_pages = ['home','downloads','help','about','contact']
    end
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params[:page].permit(:description, :content, :title)
    end
end
