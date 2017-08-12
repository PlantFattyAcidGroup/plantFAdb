class RenameLipidMeasureToLipidType < ActiveRecord::Migration
  def change
    rename_column :datasets, :lipid_measure, :lipid_type
  end
end