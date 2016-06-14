class TreeController < ApplicationController
  skip_authorization_check :only => :index
  def index
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
      plantae: "#EEE",
      lycophytes: "#aa7243",
      monilophytes: "#7a5230",
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
  end
end