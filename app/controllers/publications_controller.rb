class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  def index
    @publications = Publication.order(sort_column + ' ' + sort_direction)
    .includes(:plant)
    .joins("left outer join (select count(r.id) result_count, p.id pub_id from results r left outer join publications p on r.publication_id = p.id group by p.id) pub on pub.pub_id = publications.id ")
    .page params[:page]
    if(params[:query])
      q = params[:query].upcase
      @publications = @publications.where('
        upper(year) LIKE ?
        OR upper(authors) LIKE ?
        OR upper(journal) LIKE ?
        OR upper(volume) LIKE ?
        OR upper(page) LIKE ?
        OR upper(remarks) LIKE ?',
        "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
    if params[:plant_id]
      @publications = @publications.where('plant_id = ?',params[:plant_id])
    end
    respond_to do |format|
      # Base html query
      format.html{ @publications = @publications.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["Plant","Year","Authors","Journal","Volume","Page","Remarks","Result Count"])
          @publications.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.plant.display_name,
              item.year,
              item.authors,
              item.journal,
              item.volume,
              item.page,
              item.remarks,
              item.results.count
            ])
          end
        end
      }
    end
  end

  # GET /publications/1
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
    @publication = Publication.new(resource_params)

    if @publication.save
      redirect_to @publication, notice: 'Publication was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @publication.update(resource_params)
      redirect_to @publication, notice: 'Publication was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
    redirect_to publications_url, notice: 'Publication was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:publication).permit(:year, :authors, :journal, :volume, :page, :remarks, :plant_id)
    end
end
