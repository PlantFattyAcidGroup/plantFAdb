# == Schema Information
#
# Table name: tree_nodes
#
#  id          :integer          not null, primary key
#  name        :string
#  common_name :string
#  note        :string(3999)
#  ancestry    :string
#  string      :string
#
# Indexes
#
#  index_tree_nodes_on_ancestry  (ancestry)
#

class TreeNode < ActiveRecord::Base
  has_ancestry
  
end
