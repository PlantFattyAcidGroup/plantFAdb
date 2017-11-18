# == Schema Information
#
# Table name: tree_nodes
#
#  id             :integer          not null, primary key
#  name           :string
#  common_name    :string
#  note           :string(3999)
#  ancestry       :string
#  string         :string
#  ancestry_depth :integer          default(0)
#  pos            :integer          default(0)
#  color          :string
#
# Indexes
#
#  index_tree_nodes_on_ancestry  (ancestry)
#

class TreeNode < ActiveRecord::Base
  has_ancestry :cache_depth=>true
end
