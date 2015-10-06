class CreatePlantsPubs < ActiveRecord::Migration
  def change
    create_table :plants_pubs do |t|
      t.integer :pub_id
      t.integer :plant_id
    end
  end
end
