class StatsController < ApplicationController
  def index
    authorize! :stats, :home
    @missing_plant_orders = Plant.where
                                 .not("EXISTS (Select * from tree_nodes where upper(tree_nodes.name) = upper(plants.order_name))")
                                 .group(:order_name).count.sort_by{|p| p[1]}.reverse
  
    fa_totals = Result.joins(:measure).where("measures.type = 'FattyAcid'").group(:dataset_id).sum(:value)
    @dataset_fa_average = fa_totals.inject(0.0) { |sum, el| sum + el[1] } / fa_totals.size
    puts fa_totals.first
    puts '--'
    min = fa_totals.min{|e| e[1].to_f}
    puts min.inspect
    dmin = Dataset.find_by(id: min[0])
    
    max = fa_totals.max{|e| e[1].to_f}
    puts max.inspect
    dmax = Dataset.find_by(id: max[0])
    
    @dataset_min = [dmin,min[1]]
    @dataset_max = [dmax,max[1]]                
  end
end