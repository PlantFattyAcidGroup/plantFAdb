class AddNameAndFormulaToMeasure < ActiveRecord::Migration
  def change
    add_column :measures, :name, :string
    add_column :measures, :other_names, :string, limit: 3999
    add_column :measures, :formula, :string
  end
end