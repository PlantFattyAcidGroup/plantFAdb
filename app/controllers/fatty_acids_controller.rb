class FattyAcidsController < ApplicationController
  require "unicode_utils/upcase"
  load_and_authorize_resource
  # GET /fatty_acids
  def index
    @categories = FattyAcid.select("distinct(category)").map(&:category).compact.sort
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /.*sqlite.*/
      @fatty_acids = @fatty_acids.order(sort_column + ' ' + sort_direction + ', measures.id asc')
    else
      @fatty_acids = @fatty_acids.order(sort_column + ' ' + sort_direction + ' nulls last, measures.id asc')
    end
    
    result_count = Result.viewable.published
                         .joins(:measure)
                         .group("measures.id")
                         .select("count(distinct(results.id)) result_count, measures.id measure_id")
                         
    @fatty_acids = @fatty_acids.published
                               .joins("left outer join (#{result_count.to_sql}) res on res.measure_id = measures.id")
                               .select("measures.*, res.result_count")
    
    if(params[:query].present?)
      q = UnicodeUtils.upcase(params[:query])
      @fatty_acids = @fatty_acids.where('
        upper(name) like :q
        OR upper(other_names) LIKE :q
        OR result_count = :f
        OR upper(delta_notation) LIKE :q
        OR upper(cas_number) LIKE :q
        OR upper(sofa_mol_id) LIKE :q
        OR upper(lipidmap_id) LIKE :q
        OR upper(formula) LIKE :q
        OR upper(category) LIKE :q
        OR upper(common_name) LIKE :q
        OR upper(iupac_name) LIKE :q
        OR mass = :f',
        {q: "%#{q}%", f: q.to_f}, 
      )
    end
    unless params[:mass_min].blank?
      @fatty_acids = @fatty_acids.where("mass >= ?",params[:mass_min].to_i)
    end
    unless params[:mass_max].blank?
      @fatty_acids = @fatty_acids.where("mass <= ?",params[:mass_max].to_i)
    end
    unless params[:delta_notation_query].blank?
      q = UnicodeUtils.upcase(params[:delta_notation_query])
      @fatty_acids = @fatty_acids.where("upper(delta_notation) like ?","%#{q}%")
    end
    unless params[:name_query].blank?
      q = UnicodeUtils.upcase(params[:name_query])
      @fatty_acids = @fatty_acids.where("upper(name) like ?
      OR upper(other_names) LIKE ?
      OR upper(common_name) LIKE ?",
      "%#{q}%","%#{q}%","%#{q}%")
    end
    case params[:has_data]||='true'
    when 'false'
      @fatty_acids = @fatty_acids.where("res.result_count is null")
    when 'true'
      params[:has_data]='true'
      @fatty_acids = @fatty_acids.where("res.result_count is not null")
    end
    unless params[:category].blank?
      @fatty_acids = @fatty_acids.where(category: params[:category])
    end
    
    
    
    respond_to do |format|
      # Base html query
      format.html{
        @fatty_acids = @fatty_acids.page(params[:page])
      }
      # TXT download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["ID","Delta notation","Name","Common Name","Other Names","Category","Formula","Mass","IUPAC Name","inchi","stdinchi","stdinchikey","smiles","Cas number", "Sofa mol ID", "LipidMaps ID", "PubChem ID", "ChEBI ID","Result Count"])
          @fatty_acids.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              (can? :edit, item) ? "=HYPERLINK(\"#{root_url}js_redirect.html?page=#{edit_fatty_acid_path(item.id)}\",\"#{item.id}\")" : item.id,
              " #{item.delta_notation}",
              item.name,
              item.common_name,
              item.other_names,
              item.category,
              item.formula,
              item.mass,
              item.iupac_name,
              item.inchi,
              item.stdinchi,
              item.stdinchikey,
              item.smiles,
              item.cas_number,
              item.sofa_mol_id,
              item.lipidmap_id,
              item.pubchem_id,
              item.chebi_id,
              item.result_count
            ])
          end
        end
      }
    end
  end

  # GET /fatty_acids/1
  def show
    @results = @fatty_acid.results.includes(dataset:[plants_pub: [:pub, :plant]])
    if params[:plant_id].present? && @plant = Plant.find_by(id: params[:plant_id].to_i)
      @results = @results.where(plants_pubs: {plant_id: @plant.id})
    end
    @results = @results.order(sort_column + ' ' + sort_direction)
                       .page(params[:page]).per(50) 
  end

  # GET /fatty_acids/new
  def new
  end

  # GET /fatty_acids/1/edit
  def edit
  end

  # POST /fatty_acids
  def create
    @fatty_acid.user_id = current_user.try(:id)
    if @fatty_acid.save_draft
      redirect_to @fatty_acid, notice: 'A draft of the new Fatty Acid was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fatty_acids/1
  def update
    @fatty_acid.attributes = resource_params
    if @fatty_acid.save_draft
      redirect_to @fatty_acid, notice: 'A draft of the Fatty acid update was saved successfully.'
    else
      render :edit
    end
  end

  # DELETE /fatty_acids/1
  def destroy
    if @fatty_acid.results.empty?  
      @fatty_acid.draft_destruction
      redirect_to fatty_acids_url, notice: 'Fatty acid marked for destruction.'
    else
      redirect_to fatty_acids_url, notice: 'Fatty acid still has data. You must move or delete all datapoints first.'
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:fatty_acid).permit(:name, :common_name, :other_names, :category, :formula, :type, :delta_notation, :image_link,
        :cas_number, :sofa_mol_id, :lipidmap_id, :pubchem_id, :chebi_id, :structure, :mass,
        :inchi,:stdinchi,:stdinchikey,:smiles,:iupac_name)
    end
    
    def sort_column
      if params[:action] == 'index'
        col = ['mass','name', 'delta_notation', 'formula', 'sofa_mol_id','result_count'].find{|c| c==params[:sort]}
        col || "mass"
      else
        col = ['plants.genus','unit', 'value', 'pubs.was_authors'].find{|c| c==params[:sort]}
        col || "results.value"
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
