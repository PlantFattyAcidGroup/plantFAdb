class AddStructureToMeasure < ActiveRecord::Migration
  def change
    add_column :measures, :structure, :text
  end
end