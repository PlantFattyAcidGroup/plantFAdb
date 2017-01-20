class AddTimestampsToPlantsPubs < ActiveRecord::Migration
  def change
    add_timestamps :plants_pubs
  end
end