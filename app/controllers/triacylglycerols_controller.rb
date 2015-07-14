class TriacylglycerolsController < ApplicationController
  before_action :set_triacylglycerol, only: [:show, :edit, :update, :destroy]

  # GET /triacylglycerols
  def index
    @triacylglycerols = Triacylglycerol.order(sort_column + ' ' + sort_direction)
    .includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
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
    respond_to do |format|
      # Base html query
      format.html{ @triacylglycerols = @triacylglycerols.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["Name", "Sofa mol ID"])
          @triacylglycerols.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.delta_notation,
              item.sofa_mol_id,
            ])
          end
        end
      }
    end
  end

  # GET /triacylglycerols/1
  def show
    @results = @triacylglycerol.results.includes(publication: :plant)
    .order(sort_column + ' ' + sort_direction)
    .page(params[:page])
    .joins("left outer join (select count(pub_results.id) result_count, this_result.id result_id from publications p left outer join results this_result on p.id = this_result.publication_id left outer join results pub_results on pub_results.publication_id = p.id group by this_result.id) res on res.result_id = results.id ")
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
