class PubsController < ApplicationController
  load_and_authorize_resource  
  # GET /publications
  def index
    if params[:plant_id]
      @pubs = @pubs.includes(:plants).references(:plants).where('plants.id = ?',params[:plant_id])
    end
    @pubs = @pubs.order(sort_column + ' ' + sort_direction + ", pubs.id ASC")
    @pubs = @pubs.joins("left outer join (select count(r.id) result_count, p.id pub_id from results r left outer join pubs p on r.pub_id = p.id group by p.id) pub on pub.pub_id = pubs.id ")
    if(params[:query])
      q = params[:query].upcase
      @pubs = @pubs.where('
        upper(wos_year) LIKE ?
        OR upper(wos_authors) LIKE ?
        OR upper(wos_journal) LIKE ?
        OR upper(wos_volume) LIKE ?
        OR upper(wos_pages) LIKE ?
        OR upper(wos_uid) LIKE ?
        OR upper(doi) LIKE ?',
        "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%" )
    end

    respond_to do |format|
      # Base html query
      format.html{ @pubs = @pubs.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line([
            "ID","Year","Authors","Journal","Volume","Page",
            "DOI","WOS_Title","WOS_UID","WOS_Year","WOS_Authors","WOS_Journal","WOS_Volume","WOS_Pages"
            ])
          @pubs.find_each do |item|
            out << CSV.generate_line([
              item.id,
              item.year,
              item.authors,
              item.journal,
              item.volume,
              item.page,
              item.doi,
              item.wos_title,
              item.wos_uid,
              item.wos_year,
              item.wos_authors,
              item.wos_journal,
              item.wos_volume,
              item.wos_pages
            ])
          end
        end
      }
    end
  end

  def check_wos_uid
    uid = params[:uid]
    pub = Pub.find_by(wos_uid: uid) if uid
    if pub
      render json: {
        pub: {
          wos_title: pub.wos_title,
          wos_year: pub.wos_year,
          wos_authors: pub.wos_authors,
          wos_journal: pub.wos_journal,
          wos_volume: pub.wos_volume,
          wos_pages: pub.wos_pages
        }
      }
    else
      render json: {
        pub: nil
      }
    end
  end
  
  # GET /publications/1
  def show
  end

  # GET /publications/new
  def new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
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
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:pub).permit(:doi,:wos_uid,:wos_title,:wos_year,:wos_authors,:wos_journal,:wos_volume,:wos_pages,
      :year, :authors, :journal, :volume, :page, :url, :abstract)
    end
  
    def sort_column
      params[:sort] || "pubs.wos_authors, pubs.wos_year"
    end
end