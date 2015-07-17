class AddNewIdsToMeasure < ActiveRecord::Migration
  def change
    add_column :measures, :lipidmap_id, :string
    add_column :measures, :pubchem_id, :string
    add_column :measures, :chebi_id, :string
  end
end