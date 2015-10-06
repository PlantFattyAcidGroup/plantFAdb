class AddPubAndPlantToResult < ActiveRecord::Migration
  def change
    add_column :results, :pub_id, :integer
    add_column :results, :plant_id, :integer
  end
end