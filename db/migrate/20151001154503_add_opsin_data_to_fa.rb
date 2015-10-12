class AddOpsinDataToFa < ActiveRecord::Migration
  def change
    add_column :measures, :cml, :text
    add_column :measures, :inchi, :string
    add_column :measures, :stdinchi, :string
    add_column :measures, :stdinchikey, :string
    add_column :measures, :smiles, :string
  end
end