class AddDepthToTreeNode < ActiveRecord::Migration

  def change
    add_column :tree_nodes, :ancestry_depth, :integer, :default => 0
    add_column :tree_nodes, :pos, :integer, :default => 0
    add_column :tree_nodes, :color, :string

    TreeNode.rebuild_depth_cache!
  	colors = {
      plantae: "#EEE",
      gymnosperms: "#BE9FE6",
      lycophytes: "#D0D0D0",
      monilophytes: "#CCC",
      spermatophyte: "#E0E0E0",
      anita: "#D0ECF2",
      angiosperms: "#D3EEF5",
      magnoliids: "#86C0CE",
      monocots: "#B0D4B7",
      commelinids: "#63B384",
      eudicots: "#FFF27B",
      core_eudicots: "#C6D979",
      rosids: "#F4D2DD",
      fabids: "#ECB5CA",
      malvids: "#E58BAF",
      asterids: "#F6D7BA",
      lamiids: "#EEB688",
      campanulids: "#E6955E",
      dilleniales: "#FAE7EC",
      santalales: "#FBEBD7",
      berberidopsidales: "#FBEBD7",
      caryophyllales: "#FBEBD7"
  	}
    TreeNode.all.each do |t|
      name = t.name.downcase.gsub(' ','_').to_sym
      t.color = colors[name]
      t.save
    end
  end
end
