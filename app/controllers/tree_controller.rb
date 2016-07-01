class TreeController < ApplicationController
  skip_authorization_check
  def index
    @categories = FattyAcid.select("distinct(category)").map(&:category).compact
    #@fatty_acids = FattyAcid.with_results.order("measures.name asc")
    @fatty_acids = FattyAcid.where("delta_notation in(
       '8:0',
       '10:0',
       '12:0',
       '14:1cy',
       '16:1-delta-9c',
       '18:4-delta-9,11,13,15',
       '18:3-delta-9c,12c,15c',
       '18:3-delta-6c,9c,12c',
       '18:3-delta-9t,11t,13t',
       '8,9-cpe-18:1',
       '18:1-delta-5c',
       '18:1-delta-6c',
       '18:2-delta-9c,12a',
       '18:1-delta-9c',
       '18:1-delta-11c',
       '15,16-O-18:2-delta-9c,12c',
       '9,10-cpe-19:1',
       '9,10-O-18:1-delta-12c',
       '9,10-cpa-19:0',
       '12-OH-18:1-delta-9c',
       '20:1cy',
       '20:1-delta-11c',
       '20:0',
       '22:1-delta-13c',
       '22:0',
       '24:1-delta-15c',
       '24:0'
    )").order("measures.mass asc")
    
    @selected = FattyAcid.find_by(id: params[:measure_id]) if params[:measure_id]
    @value_method = (params[:measure_id].blank?&&params[:category].blank?) ? 'totalCount' : 'maxVal'
  end
  
  def data
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
    tree = TreeNode.arrange_serializable(:order => :id) do |parent, children|
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
        #avg = results.average(:value).to_f.try(:round,4)
      else
        name = parent.name.downcase.gsub(' ','_').to_sym
        color = phyloColors[name]
      end
      {
        id: parent.name,
        name: parent.name,
        note: parent.note,
        max: max,
        avg: avg, 
        count: count,
        children: children,
        color: color,
        taxon: [parent.name]
      }
    end
    expires_in 24.hours
    render json: tree
  end
end