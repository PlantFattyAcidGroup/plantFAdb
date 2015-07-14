class FattyAcidsController < ApplicationController
  before_action :set_fatty_acid, only: [:show, :edit, :update, :destroy]

  # GET /fatty_acids
  def index
    @fatty_acids = FattyAcid.includes([:trivial_names,:systematic_names])
    .references([:trivial_names,:systematic_names])
    .order(sort_column + ' ' + sort_direction)
    .page params[:page]
    if(params[:query])
      q = params[:query].upcase
      @fatty_acids = @fatty_acids.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR upper(delta_notation) LIKE ?
        OR upper(cas_number) LIKE ?
        OR upper(sofa_mol_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
  end

  # GET /fatty_acids/1
  def show
    @results = @fatty_acid.results.includes(publication: :plant)
    .order(sort_column + ' ' + sort_direction)
    .page(params[:page])
    .joins("left outer join (select count(pub_results.id) result_count, this_result.id result_id from publications p left outer join results this_result on p.id = this_result.publication_id left outer join results pub_results on pub_results.publication_id = p.id group by this_result.id) res on res.result_id = results.id ")  
  end

  # GET /fatty_acids/new
  def new
    @fatty_acid = FattyAcid.new
  end

  # GET /fatty_acids/1/edit
  def edit
  end

  # POST /fatty_acids
  def create
    @fatty_acid = FattyAcid.new(resource_params)

    if @fatty_acid.save
      redirect_to @fatty_acid, notice: 'Fatty acid was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fatty_acids/1
  def update
    if @fatty_acid.update(resource_params)
      redirect_to @fatty_acid, notice: 'Fatty acid was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fatty_acids/1
  def destroy
    @fatty_acid.destroy
    redirect_to fatty_acids_url, notice: 'Fatty acid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fatty_acid
      @fatty_acid = FattyAcid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:fatty_acid).permit(:type, :delta_notation, :cas_number, :sofa_mol_id)
    end
end
