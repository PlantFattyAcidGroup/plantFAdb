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
    tree = TreeNode.arrange_serializable(:order => :pos) do |parent, children|
      max = avg = count = nil
      if children.empty?
        if !params[:measure_id].blank?
          results = Result.joins(:measure, dataset: [plants_pub: [:plant]])
          .where("measures.id = ?", params[:measure_id])
          .where("results.unit = 'GLC-Area-%' or results.unit = 'weight-%'")
          .where("plants.order_name = '#{parent.name}'")
        elsif !params[:category].blank?
          results = Result.joins(:measure, dataset: [plants_pub: [:plant]])
          .where("measures.category = ?", params[:category])
          .where("results.unit = 'GLC-Area-%' or results.unit = 'weight-%'")
          .where("plants.order_name = '#{parent.name}'")
        else
          results = Result.joins(:measure, dataset: [plants_pub: [:plant]])
            .where("measures.type ='FattyAcid'")
            .where("results.unit = 'GLC-Area-%' or results.unit = 'weight-%'")
            .where("plants.order_name='#{parent.name}'")
        end
        count = results.count
        max = results.maximum(:value).to_f.try(:round,4)
        avg = results.average(:value).to_f.try(:round,4)
      end
      name = parent.name.downcase.gsub(' ','_').to_sym
      {
        id: parent.name,
        name: parent.name,
        note: parent.note,
        max: max,
        avg: avg, 
        count: count,
        children: children,
        color: parent.color,
        taxon: [parent.name]
      }
    end
    expires_in 2.hours
    render json: tree
  end
end