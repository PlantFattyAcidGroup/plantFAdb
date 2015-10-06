class PubsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  def index
    @pubs = Pub.order(sort_column + ' ' + sort_direction + ", id asc")
    .joins("left outer join (select count(r.id) result_count, p.id pub_id from results r left outer join pubs p on r.pub_id = p.id group by p.id) pub on pub.pub_id = pubs.id ")
    if(params[:query])
      q = params[:query].upcase
      @pubs = @pubs.where('
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
      @pubs = @pubs.where('plant_id = ?',params[:plant_id])
    end
    respond_to do |format|
      # Base html query
      format.html{ @pubs = @pubs.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["ID","Year","Authors","Journal","Volume","Page","Result Count","Plant Count"])
          @pubs.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.id,
              item.year,
              item.authors,
              item.journal,
              item.volume,
              item.page,
              item.results.count,
              item.plants.count
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
    @pub = Pub.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
    @pub = Pub.new(resource_params)

    if @pub.save
      redirect_to @pub, notice: 'Pub was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @pub.update(resource_params)
      redirect_to @pub, notice: 'Pub was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /publications/1
  def destroy
    @pub.destroy
    redirect_to pubs_url, notice: 'Pub was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @pub = Pub.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:pub).permit(:year, :authors, :journal, :volume, :page, :plant_id)
    end
end