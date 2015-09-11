class HomeController < ApplicationController
  def index
    
    @tree = TreeNode.arrange_serializable do |parent, children|
      {
         name: parent.name,
         children: children,
         common_name: parent.common_name,
         value: 1
      }
    end
  end
end