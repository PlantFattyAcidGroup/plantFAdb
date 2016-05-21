class FattyAcidsController < ApplicationController
  require "unicode_utils/upcase"
  load_and_authorize_resource
  # GET /fatty_acids
  def index
    @fatty_acids = @fatty_acids.order(sort_column + ' ' + sort_direction + ', measures.id asc')
    .joins("left outer join (select count(r.id) result_count, m.id measure_id from results r left outer join measures m on r.measure_id = m.id group by m.id) res on res.measure_id = measures.id ")
    .select("measures.*, res.result_count")
    if(params[:query])
      q = UnicodeUtils.upcase(params[:query])
      @fatty_acids = @fatty_acids.where('
        upper(name) like ?
        OR upper(other_names) LIKE ?
        OR result_count like ?
        OR upper(delta_notation) LIKE ?
        OR upper(cas_number) LIKE ?
        OR upper(sofa_mol_id) LIKE ?
        OR upper(lipidmap_id) LIKE ?
        OR upper(formula) LIKE ?
        OR mass = ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", q.to_f
      )
    end
    case params[:has_data]
    when 'true'
      @fatty_acids = @fatty_acids.where("res.result_count is not null")
    when 'false'
      @fatty_acids = @fatty_acids.where("res.result_count is null")
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
        @fatty_acids = @fatty_acids.page(params[:page])
      }
      # TXT download
      format.csv{
        render_tab do |out|
          out << CSV.generate_line(["ID","Delta notation","Name","Other Names","Formula","Mass", "Cas number", "Sofa mol ID", "LipidMaps ID", "PubChem ID","Systematic Names(s)", "Trivial Name(s)","Result Count"],
          col_sep: "\t")
          @fatty_acids.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.id,
              " #{item.delta_notation}",
              item.name,
              item.other_names,
              item.formula,
              item.mass,
              item.cas_number,
              item.sofa_mol_id,
              item.lipidmap_id,
              item.pubchem_id,
              item.systematic_names.map(&:name).join("; "),
              item.trivial_names.map(&:name).join("; "),
              item.result_count
            ], col_sep: "\t")
          end
        end
      }
    end
  end

  # GET /fatty_acids/1
  def show
    @results = @fatty_acid.results.includes(:pub, :plant)
    .order(sort_column + ' ' + sort_direction)
    .page(params[:page])
    #.joins("left outer join (select count(pub_results.id) result_count, this_result.id result_id from publications p left outer join results this_result on p.id = this_result.publication_id left outer join results pub_results on pub_results.publication_id = p.id group by this_result.id) res on res.result_id = results.id ")  
  end

  # GET /fatty_acids/new
  def new
  end

  # GET /fatty_acids/1/edit
  def edit
  end

  # POST /fatty_acids
  def create
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
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:fatty_acid).permit(:name,:other_names,:formula, :type, :delta_notation, :image_link,
        :cas_number, :sofa_mol_id, :lipidmap_id, :pubchem_id, :chebi_id, :structure, :mass,
        :inchi,:stdinchi,:stdinchikey,:smiles)
    end
    
    def sort_column
      if params[:action] == 'index'
        params[:sort]||"mass"
      else
        params[:sort] || "results.value"
      end
      
    end
    
    def sort_direction
      if params[:action] == 'index'
        super
      else
        params[:direction] == 'asc' ?  params[:direction] : "desc"
      end
    end
    
end
