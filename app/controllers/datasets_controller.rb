class DatasetsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    @datasets = @datasets.joins(plants_pub: [:plant, :pub])
                         
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /.*sqlite.*/
      @datasets = @datasets.order(sort_column + ' ' + sort_direction+", datasets.id asc")
    else
      @datasets = @datasets.order(sort_column + ' ' + sort_direction+" nulls last, datasets.id asc")
    end
    
    result_count = Result.joins(:measure, :dataset)
                         .group("datasets.id")
                         .select("count(distinct(results.id)) result_count, sum(results.value) result_total, datasets.id dataset_id")
    
    @datasets = @datasets.joins("left outer join (#{result_count.to_sql}) res on res.dataset_id = datasets.id")
                         .select("datasets.*, res.result_count, res.result_total")
                    
    if(params[:query])
      q = UnicodeUtils.upcase(params[:query])
      @datasets = @datasets.where('
        upper(datasets.dbxref_value) LIKE :q
        OR upper(datasets.tissue) LIKE :q
        OR upper(datasets.lipid_type) LIKE :q
        OR upper(datasets.remarks) LIKE :q
        OR upper(plants.sofa_name) LIKE :q
        OR upper(plants.note) LIKE :q
        OR upper(plants.sofa_family) LIKE :q
        OR upper(plants.order_name) LIKE :q
        OR upper(plants.family) LIKE :q
        OR upper(plants.genus) LIKE :q
        OR upper(plants.species) LIKE :q
        OR upper(plants.tnrs_family) LIKE :q
        OR upper(plants.tnrs_name) LIKE :q
        OR upper(plants.common_name) LIKE :q
        OR upper(plants.variety) LIKE :q
        OR upper(plants.authority) LIKE :q
        OR upper(plants.tnrs_name_submitted) LIKE :q
        OR upper(plants.genus || \' \' || plants.species) LIKE :q
        OR upper(pubs.wos_year) LIKE :q
        OR upper(pubs.wos_authors) LIKE :q
        OR upper(pubs.wos_journal) LIKE :q
        OR upper(pubs.wos_volume) LIKE :q
        OR upper(pubs.wos_pages) LIKE :q
        OR upper(pubs.wos_uid) LIKE :q
        OR upper(pubs.wos_title) LIKE :q
        OR upper(pubs.abstract) LIKE :q
        OR upper(pubs.doi) LIKE :q',
        {q: "%#{q}%"}
      )
    end
    
    if params[:plant_id] && @plant = Plant.find_by(id: params[:plant_id])
      @datasets = @datasets.where(plants_pubs: {plant_id: params[:plant_id]})
    end
    if params[:pub_id] && @pub = Pub.find_by(id: params[:pub_id])
      @datasets = @datasets.where(plants_pubs: {pub_id: params[:pub_id]})
    end
    
    @datasets = @datasets.published
    respond_to do |format|
      # Base html query
      format.html{ @datasets = @datasets.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line([""]+Dataset.extra_download_columns)
          out << CSV.generate_line(["ID"]+Dataset.download_columns.keys.map(&:titleize))
          @datasets.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              (can? :edit, item) ? "=HYPERLINK(\"#{root_url}js_redirect.html?page=#{edit_dataset_path(item.id)}\",\"#{item.id}\")" : item.id
            ]+Dataset.download_columns.map{|k,v| item.send(v)})
          end
        end
      }
    end
  end
  
  def show
    redirect_to edit_dataset_path @dataset
  end
  
  # GET /results/new
  def new
    @dataset.plants_pub_id ||= params[:plants_pub_id]
  end

  # GET /results/1/edit
  def edit
    default_measures = Measure.where(id: [10027,10035,10046,10051,10066,10074,10077,10090,10114,10127,10131,10147,10152,10000])
    
    @results = @dataset.results.to_a    
    ### Used measures from this dataset
    used_measures = @results.map(&:measure).uniq
    
    (default_measures-used_measures).each do |m|
      @results << @dataset.results.build(measure: m)
    end
    
    r_mol = @results.select{|r| r.measure.try(:sofa_mol_id).present?}.sort_by{|r| r.measure.sofa_mol_id}
    r_new = @results.reject{|r| r.measure.try(:sofa_mol_id).present?}.sort_by{|r| r.measure.try(:mass).to_f}
    @results = r_mol+r_new
  
    5.times do |i|
      @results << @dataset.results.build
    end
  end

  # POST /results
  def create
    if @dataset.save_draft
      redirect_to edit_dataset_path(@dataset)
    else
      render :new
    end
  end

  # PATCH/PUT /results/1
  def update
    @dataset.attributes = resource_params
    if @dataset.save_draft
      redirect_to edit_dataset_path(@dataset)
    else
      render :edit
    end
  end

  # DELETE /results/1
  def destroy
    if @dataset.draft_destruction
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id), notice: 'Dataset removed.'
    else
      redirect_to edit_plants_pub_path(@dataset.plants_pub_id), notice: 'Error removing dataset.'
    end
  end
  
  private
  
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:dataset).permit(:dbxref_id, :dbxref_value, :remarks, :notes, :plants_pub_id, :lipid_type, :tissue)
  end
  
  def sort_column
    col = [
            'pubs.wos_authors',
            'pubs.wos_year',
            'pubs.wos_title',
            'pubs.wos_journal',
            'pubs.doi',
            'res.result_count', 'res.result_total',
            'plants.genus','plants.variety','plants.species', 'plants.common_name'
          ].find{|c| c==params[:sort]}
    col || "pubs.wos_title, plants.genus, plants.species"
  end
  
end