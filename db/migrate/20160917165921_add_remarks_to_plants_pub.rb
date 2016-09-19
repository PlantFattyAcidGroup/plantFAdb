class AddRemarksToPlantsPub < ActiveRecord::Migration
  def change
    add_column :plants_pubs, :remarks, :string
    add_column :plants_pubs, :notes, :string
  end
end