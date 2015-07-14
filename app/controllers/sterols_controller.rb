class SterolsController < ApplicationController
  before_action :set_sterol, only: [:show, :edit, :update, :destroy]

  # GET /sterols
  def index
    @sterols = Sterol.order(sort_column + ' ' + sort_direction)
    .includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
    if(params[:query])
      q = params[:query].upcase
      @sterols = @sterols.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR upper(delta_notation) LIKE ?
        OR upper(sofa_mol_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%"
      )
    end
    respond_to do |format|
      # Base html query
      format.html{ @sterols = @sterols.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["Name", "Sofa mol ID", "Systematic Names(s)"])
          @sterols.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.delta_notation,
              item.sofa_mol_id,
              item.systematic_names.map(&:name).join("; ")
            ])
          end
        end
      }
    end
  end

  # GET /sterols/1
  def show
    @results = @sterol.results.includes(publication: :plant)
    .order(sort_column + ' ' + sort_direction)
    .page(params[:page])
    .joins("left outer join (select count(pub_results.id) result_count, this_result.id result_id from publications p left outer join results this_result on p.id = this_result.publication_id left outer join results pub_results on pub_results.publication_id = p.id group by this_result.id) res on res.result_id = results.id ")
  end

  # GET /sterols/new
  def new
    @sterol = Sterol.new
  end

  # GET /sterols/1/edit
  def edit
  end

  # POST /sterols
  def create
    @sterol = Sterol.new(resource_params)

    if @sterol.save
      redirect_to @sterol, notice: 'Sterol was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sterols/1
  def update
    if @sterol.update(resource_params)
      redirect_to @sterol, notice: 'Sterol was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sterols/1
  def destroy
    @sterol.destroy
    redirect_to sterols_url, notice: 'Sterol was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sterol
      @sterol = Sterol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:sterol).permit(:delta_notation, :cas_number, :sofa_mol_id)
    end
end
