class AddTnrsToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :tnrs_name, :string
    add_column :plants, :tnrs_family, :string
  end
end