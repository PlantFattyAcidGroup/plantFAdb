class CreateTreeNodes < ActiveRecord::Migration
  def change
    create_table :tree_nodes do |t|
      t.string :name
      t.string :common_name
      t.string :note, limit: 3999
      t.string :ancestry, :string
    end
    add_index :tree_nodes, :ancestry
  end
end
