class PlantsController < ApplicationController
  require "unicode_utils/upcase"
  load_and_authorize_resource
  # GET /plants
  def index
    oil_content = Parameter.where("upper(delta_notation)='OIL CONTENT'").first
    @plants = @plants.order(sort_column + ' ' + sort_direction+" nulls last, id asc")
    .joins("left outer join (select count(distinct(p.pub_id)) pub_count, l.id plant_id from plants_pubs p left outer join plants l on p.plant_id = l.id group by l.id) pub on pub.plant_id = plants.id ")
    .joins("left outer join (select count(r.id) result_count, l.id plant_id from results r left outer join plants l on r.plant_id = l.id left outer join measures m on m.id = r.measure_id where unit in ('GLC-Area-%','weight-%') AND m.type in ('FattyAcid','Parameter') group by l.id) res on res.plant_id = plants.id ")
    .page(params[:page])
    if oil_content
      @plants = @plants.joins("left outer join (
        select avg(r.value) avg_oil_content, p.id plant_id from results r left outer join plants p on r.plant_id = p.id where r.measure_id = #{oil_content.id} group by p.id
      ) oil_res on oil_res.plant_id = plants.id ")
      .select("plants.*, pub.pub_count, res.result_count, oil_res.avg_oil_content")
    else
      @plants = @plants.select("plants.*, pub.pub_count, res.result_count")
    end
    if(params[:query])
      q = UnicodeUtils.upcase(params[:query])
      @plants = @plants.where('
        upper(sofa_name) LIKE ?
        OR upper(note) LIKE ?
        OR upper(sofa_family) LIKE ?
        OR upper(order_name) LIKE ?
        OR upper(family) LIKE ?
        OR upper(genus) LIKE ?
        OR upper(species) LIKE ?
        OR upper(tnrs_family) LIKE ?
        OR upper(tnrs_name) LIKE ?
        OR upper(common_name) LIKE ?',
        "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%"
      )
    end
    if params[:fmt] == 'tree'
      @format_partial = 'tree'
    else
      @format_partial = 'listing'
    end
    if @format_partial == 'tree'
      @categories = FattyAcid.select("distinct(category)").map(&:category).compact
      #@fatty_acids = FattyAcid.with_results.order("measures.name asc")
      @fatty_acids = FattyAcid.where("delta_notation in(
        '16:0',
        '18:1-delta-9c',
        '20:0',
        '14:0',
        '18:3-delta-9c,12c,15c',
        '16:1',
        '22:0',
        '12:0',
        '20:1-delta-11c',
        '20:1',
        '18:1-delta-11c',
        '24:0',
        '16:1-delta-9c',
        '10:0',
        '18:3-delta-6c,9c,12c',
        '22:1-delta-13c',
        '22:1',
        '18:3-delta-5c,9c,12c',
        '8:0',
        '8,9-cpe-18:1',
        '9,10-cpe-19:1',
        '9,10-cpa-19:0',
        '24:1-delta-15c',
        '12-OH-18:1-delta-9c',
        '15,16-O-18:2-delta-9c,12c',
        '9,10-O-18:1-delta-12c',
        '18:3-delta-9t,11t,13t',
        '20:1cy',
        '20:2cy',
        '14:1cy',
        '12:1cy',
        '18:1-delta-6a'
      )").order("measures.name asc")
  		phyloColors ={
        root: "#777",
  	    spermatophyte: "#DDD",
  	    gymnosperms: "#B0744C",
  	    anita: "#D3EEF5",
  	    angiosperms: "#D3EEF5",
  	    magnoliids: "#86C0CE",
  	    monocots: "#B0D4B7",
  	    commelinids: "#63B384",
  	    eudicots: "#FFF27B",
  	    core_eudicots: "#C6D979",
  	    rosids: "#F4D2DD",
  	    fabids: "#ECB5CA",
  	    malvids: "#E58BAF",
  	    asterid: "#F6D7BA",
  	    lamiids: "#EEB688",
  	    campanulids: "#E6955E",
  		}
      
      @selected = FattyAcid.find_by(id: params[:measure_id]) if params[:measure_id]
      # @min = nil
      # @max = 0
      @value_method = (params[:measure_id].blank?&&params[:category].blank?) ? 'totalCount' : 'maxVal'
      @tree = TreeNode.arrange_serializable(:order => :id) do |parent, children|
        max = avg = count = color = nil
        if children.empty?
          if !params[:measure_id].blank?
            results = Result.joins(:measure, :plant)
            .where("measures.id = ?", params[:measure_id])
            .where("results.unit = 'GLC-Area-%' or results.unit = 'weight-%'")
            .where("plants.order_name = '#{parent.name}'")
          elsif !params[:category].blank?
            results = Result.joins(:measure, :plant)
            .where("measures.category = ?", params[:category])
            .where("results.unit = 'GLC-Area-%' or results.unit = 'weight-%'")
            .where("plants.order_name = '#{parent.name}'")
          else
            results = Result.joins(:measure, :plant)
              .where("measures.type ='FattyAcid'")
              .where("results.unit = 'GLC-Area-%' or results.unit = 'weight-%'")
              .where("plants.order_name='#{parent.name}'")
          end
          count = results.count
          max = results.maximum(:value).to_f.try(:round,4)
          avg = results.average(:value).to_f.try(:round,4)
        else
          name = parent.name.downcase.gsub(' ','_').to_sym
          color = phyloColors[name]
        end
        {
          id: parent.name,
          name: parent.name,
          common_name: parent.common_name,
          max: max,
          avg: avg, 
          count: count,
          children: children,
          color: color,
          taxon: [parent.name]
        }
      end
      logger.info { @tree.to_yaml }
    end # end tree partial
    respond_to do |format|
      # Base html query
      format.html{ @plants = @plants.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["ID","Common Name","Genus", "Species", "Family", "Order", "Tropicos URL", "Note",
            "TNRS Family", "TNRS Name", "Accepted Rank", "Matched Rank", "Name Status",
            "SOFA Family", "SOFA Name",
            "Publication Count","Result Count"])
          @plants.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              (can? :edit, item) ? "=HYPERLINK(\"#{root_url}js_redirect.html?page=#{edit_plant_path(item.id)}\",\"#{item.id}\")" : item.id,
              item.common_name,
              item.genus,
              item.species,
              item.family,
              item.order_name,
              item.tropicos_url,
              item.note,
              item.tnrs_family,
              item.tnrs_name,
              item.accepted_rank,
              item.matched_rank,
              item.name_status,
              item.sofa_family,
              item.sofa_name,
              item.pub_count,
              item.result_count
            ])
          end
        end
      }
    end
  end

  # GET /plants/1
  def show
    @fatty_acid_data = {}
    @parameter_data = {}
    @results = @plant.results.includes(:measure).order("measures.delta_notation").where(unit: ['GLC-Area-%','weight-%'])
    @results.where("measures.type = 'FattyAcid'").each do |result|
      next unless result.unit == 'GLC-Area-%' || result.unit == 'weight-%'
      @fatty_acid_data[result.measure_id]||={object:result.measure,values:[]}
      @fatty_acid_data[result.measure_id][:values]<<result.value.round(2)
    end
    @fatty_acid_data = @fatty_acid_data.map{|k,v| v}
    @results.where("measures.type = 'Parameter'").each do |result|
      @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]||=[]
      @parameter_data["#{result.measure.delta_notation}#{result.unit ? ' - '+result.unit : ''}"]<<result.value.round(2)
    end
  end

  # GET /plants/new
  def new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  def create
    if @plant.save
      redirect_to @plant, notice: 'Plant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plants/1
  def update
    if @plant.update(resource_params)
      redirect_to [:edit,@plant], notice: 'Plant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plants/1
  def destroy
    @plant.destroy
    redirect_to plants_url, notice: 'Plant was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:plant).permit(:common_name, :tnrs_family, :tnrs_name, :accepted_rank, :name_status, :matched_rank, :order_name, :family, :genus, :species, :tropicos_url, :note)
    end
    
    def sort_column
      params[:sort] || "plants.genus, plants.species"
    end
end
