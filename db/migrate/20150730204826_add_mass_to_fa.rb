class AddMassToFa < ActiveRecord::Migration
  def change
    add_column :measures, :mass, :float
  end
end