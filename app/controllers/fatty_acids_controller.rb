class FattyAcidsController < ApplicationController
  before_action :set_fatty_acid, only: [:show, :edit, :update, :destroy]

  # GET /fatty_acids
  def index
    cols = FattyAcid.columns.reject{|c| c.name=='structure'}.map{|c| "measures.#{c.name}"}.join(',')
    
    @fatty_acids = FattyAcid.order(sort_column + ' ' + sort_direction + ', id asc')
    .joins("left outer join (select count(r.id) result_count, m.id measure_id from results r left outer join measures m on r.measure_id = m.id group by m.id) res on res.measure_id = measures.id ")
    .joins("left outer join names systematic_names_measures on systematic_names_measures.measure_id = measures.id AND systematic_names_measures.type = 'SystematicName'")
    .joins("left outer join names on names.measure_id = measures.id AND names.type = 'TrivialName'")
    .joins("left outer join (
        select count(p.id) published_count, m.id measure_id
        from measures m
        left outer join results r on m.id = r.measure_id
        left outer join publications p  on r.publication_id = p.id 
        where (p.authors is null or upper(p.authors) not like 'UNPUBLISHED%')
        and (p.remarks is null or upper(p.remarks) not like 'PRIVATE%')
        group by m.id
      ) pub on pub.measure_id = measures.id")
    .select("#{cols}, res.result_count, pub.published_count")
    .group("#{cols}, res.result_count, pub.published_count")
    #.where("cas_number is null")
    if(params[:query])
      q = params[:query].upcase
      @fatty_acids = @fatty_acids.where('
        upper(names.name) like ?
        OR upper(SYSTEMATIC_NAMES_MEASURES.name) like ?
        OR result_count like ?
        OR upper(delta_notation) LIKE ?
        OR upper(cas_number) LIKE ?
        OR upper(sofa_mol_id) LIKE ?
        OR upper(lipidmap_id) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
    case params[:has_data]
    when 'true'
      @fatty_acids = @fatty_acids.where("res.result_count is not null")
    when 'false'
      @fatty_acids = @fatty_acids.where("res.result_count is null")
    end
    case params[:published]
    when 'true'
      @fatty_acids = @fatty_acids.where("pub.published_count is not null")
    when 'false'
      @fatty_acids = @fatty_acids.where("pub.published_count is null")
    end
    case params[:has_cas]
    when 'true'
      @fatty_acids = @fatty_acids.where("cas_number is not null")
    when 'false'
      @fatty_acids = @fatty_acids.where("cas_number is null")
    end
    respond_to do |format|
      # Base html query
      format.html{
        @fatty_acids = Kaminari.paginate_array(@fatty_acids.to_a).page(params[:page])
      }
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["Delta notation", "Cas number", "Sofa mol ID", "Systematic Names(s)", "Trivial Name(s)","Result Count"])
          @fatty_acids.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.delta_notation,
              item.cas_number,
              item.sofa_mol_id,
              item.systematic_names.map(&:name).join("; "),
              item.trivial_names.map(&:name).join("; "),
              item.result_count
            ])
          end
        end
      }
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
      params.require(:fatty_acid).permit(:type, :delta_notation, :cas_number, :sofa_mol_id, :lipidmap_id, :pubchem_id, :chebi_id, :structure)
    end
end
