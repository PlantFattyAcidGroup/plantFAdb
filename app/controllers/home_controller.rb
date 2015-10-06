class HomeController < ApplicationController
  def index
    @fatty_acids = FattyAcid.with_results.order("measures.name asc")
    @tree = TreeNode.arrange_serializable do |parent, children|
      {
         name: parent.name,
         common_name: parent.common_name,
         #value: Plant.where(order_name: parent.name).count,
         value: params[:value].blank? ? 1 : Result.joins(:measure, :plant)
          .where("measures.delta_notation = ?", params[:value])
          .where("plants.order_name = '#{parent.name}'")
          .average(:value).try(:round,3),
         children: children
      }
    end
  end
end