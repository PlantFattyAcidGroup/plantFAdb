class AddColumnsToDataset < ActiveRecord::Migration
  def change
    rename_column :datasets, :source, :lipid_measure
    rename_column :datasets, :sofa_tab_id, :dbxref_value
    add_column :datasets, :dbxref_id, :integer
  end
end