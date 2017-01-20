class ResultsController < ApplicationController
  load_and_authorize_resource
  
  # GET /results
  def index
    @measure_types = Measure.select(:type).distinct.map(&:type)
    @results = @results.order(sort_column + ' ' + sort_direction).order("results.id ASC")
    .includes(:measure, :publication, plants_pub: [:plant, :pub])
    .references(:measure, :publication, plants_pub: [:plant, :pub])
    .where(measures: {type: ['FattyAcid','Parameter']})
    .where(unit:  ['GLC-Area-%','weight-%'])
    if params[:query]
      q = params[:query].upcase
      @results = @results.where('
        upper(value) LIKE ?
        OR upper(measures.type) LIKE ?
        OR upper(measures.delta_notation) LIKE ?
        OR upper(unit) LIKE ?
        OR upper(pubs.wos_year) LIKE ?
        OR upper(pubs.wos_authors) LIKE ?
        OR upper(pubs.wos_journal) LIKE ?
        OR upper(pubs.wos_volume) LIKE ?
        OR upper(pubs.wos_pages) LIKE ?
        OR upper(pubs.wos_title) LIKE ?
        OR upper(pubs.wos_uid) LIKE ?
        OR upper(pubs.remarks) LIKE ?
        OR upper(publications.sofa_tab_id) LIKE ?
        OR upper(plants.common_name) LIKE ?
        OR upper(plants.variety) LIKE ?
        OR upper(plants.species) LIKE ?
        OR upper(plants.genus) LIKE ?
        OR upper(plants.family) LIKE ?
        OR upper(plants.order_name) LIKE ?
        OR upper(plants.sofa_name) LIKE ?',
        "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%","%#{q}%", "%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%"
      )
    end
    unless params[:taxon].blank?
      taxon = params[:taxon].split(',').map(&:strip)
      @results = apply_taxon(@results,taxon)
    end
    if params[:measure_type]
      @results = @results.where("measures.type =?",params[:measure_type])
    end
    if params[:plant_id] && @plant = Plant.find_by(id: params[:plant_id])
      @results = @results.where(plants_pubs: {plant_id: params[:plant_id]})
    end
    if params[:pub_id] && @pub = Pub.find_by(id: params[:pub_id])
      @results = @results.where(plants_pubs: {pub_id: params[:pub_id]})
    end
    if params[:measure_id] && @measure = Measure.find_by(id: params[:measure_id])
      @results = @results.where(measure_id: params[:measure_id])
    end
    if params[:category]
      @results = @results.where("measures.category = ?", params[:category])
    end
    respond_to do |format|
      # Base html query
      format.html{ @results = @results.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["Measure", "Notation", "Publication", "Value", "Unit"])
          @results.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.measure.type,
              item.measure.name,
              item.measure.delta_notation,
              item.pub.display_name,
              item.value,
              item.unit
            ])
          end
        end
      }
    end
  end

  def plant_yield
    @results = Result.includes(:measure, plants_pub: [:plant, :pub]).published
    .references(:measure, :pub, :plant)
    .where(measures: {type: ['FattyAcid']})
    .where(unit:  ['GLC-Area-%','weight-%'])
    if params[:measure_id] && @measure = Measure.find_by(id: params[:measure_id])
      @results = @results.where(measure_id: params[:measure_id])
    end
    unless params[:category].blank?
      @results = @results.where("measures.category = ?", params[:category])
    end
    unless params[:taxon].blank?
      taxon = params[:taxon].split(',').map(&:strip)
      @results = apply_taxon(@results,taxon,{group: true})
    end
    count = @results.count
    max = @results.maximum(:value)#.to_f.try(:round,4)
    avg = @results.average(:value)#.to_f.try(:round,4)
      
    data = []
    count.each do |name,cnt|
      data << {
        id: name,
        name: name.is_a?(Array) ? name.join(' ') : name,
        common_name: name,
        max: max[name].to_f.try(:round,4),
        avg: avg[name].to_f.try(:round,4),
        count: cnt,
        taxon: taxon+name.split(',')
      }
    end
    data = data.sort{|a,b|a[:name]<=>b[:name]}
    p = get_plants(taxon).count
    p_data = []
    p.each do |name,p_cnt|
      next unless name
      unless count[name]
        p_data << {
          id: name,
          name: name.is_a?(Array) ? name.join(' ') : name,
          common_name: name,
          max: nil, avg: nil, count: nil, taxon: taxon+name.split(',')
        }
      end
    end
    p_data.sort!{|a,b|a[:name]<=>b[:name]}
    data.concat(p_data)
    render json: data
  end
  
  # GET /results/1
  def show
  end

  # GET /results/new
  def new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  def create
    if @result.draft_creation
      @result.plants_pub.attributes = {updated_at: Time.now}
      @result.plants_pub.draft_update
      @plants_pub = @result.plants_pub
      @original_result = (@result.draft? ? @result.draft.reify : @result)
      @form_id = params[:form_id]
      
      respond_to do |format|
       format.js
      end
    else
      redirect_to edit_plants_pub_path(@result.plants_pub_id), notice: 'Datapoint could not be created.'
    end
  end

  # PATCH/PUT /results/1
  def update
    @result.attributes = resource_params
    if @result.draft_update
      @result.plants_pub.attributes = {updated_at: Time.now}
      @result.plants_pub.draft_update
      
      redirect_to edit_plants_pub_path(@result.plants_pub_id)
    else
      redirect_to edit_plants_pub_path(@result.plants_pub_id), notice: 'Datapoint could not be updated.'
    end
  end

  # DELETE /results/1
  def destroy
    @result.draft_destruction
    redirect_to edit_plants_pub_path(@result.plants_pub_id), notice: 'Datapoint removed.'
  end

  private
    def apply_taxon(results, taxon,opts={})
      return results if taxon.blank? || taxon.empty?
      case taxon.length
      # clade / order
      when 1
        # Check for higher clade tree member first
        if t = TreeNode.find_by(name: taxon[0])
          names = t.subtree.map(&:name)
          results = results.where(plants: {order_name: names})
        else
          # lookup order
          results = results.where(plants: {order_name: taxon[0]})
        end
        results = results.group(:family) if opts[:group]
      # order,family
      when 2
        results = results.where(plants: {
          order_name: taxon[0],
          family: taxon[1]
        })
        results = results.group(:genus,:species) if opts[:group]
      # order,family,genus
      when 3
        results = results.where(plants: {
          order_name: taxon[0],
          family: taxon[1],
          genus: taxon[2]
        })
      else
        results = results.where(plants: {
          order_name: taxon[0],
          family: taxon[1],
          genus: taxon[2],
          species: taxon[3]
        })
      end
      return results
    end
    
    def get_plants(taxon)
      return [] if taxon.blank? || taxon.empty?
      case taxon.length
      when 1
        # Check for higher clade tree member first
        if t = TreeNode.find_by(name: taxon[0])
          names = t.subtree.map(&:name)
          plants = Plant.where(order_name: names).published
        else
          # lookup order
          plants = Plant.where(order_name: taxon[0]).published
        end
        plants = plants.group(:family)
      when 2
        plants = Plant.where(
          order_name: taxon[0],
          family: taxon[1]
        ).published
        plants = plants.group(:genus,:species)
      when 3
        plants = Plant.where(
          order_name: taxon[0],
          family: taxon[1],
          genus: taxon[2]
        ).published
        plants = plants.group(:species)
      else
        plants= []
      end
    end
    
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:result).permit(:value, :unit, :measure_id, :plants_pub_id)
    end
    
    def sort_column
      col = ['measures.type','measure.name', 'pubs.authors', 'plants.genus', 'unit','value','measures.delta_notation'].find{|c| c==params[:sort]}
      if col
        col
      elsif params[:pub_id]
        "plants.genus asc, plants.species asc, pubs.authors, delta_notation asc, value"
      elsif params[:taxon]
        "plants.genus asc, plants.species asc, delta_notation asc, value"
      elsif params[:plant_id]
        "delta_notation asc, value"
      else
        "value"
      end
    end
    
    def sort_direction
      params[:direction]=='asc' ? params[:direction] : "desc" 
    end
end
