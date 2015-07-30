class AddMassToFa < ActiveRecord::Migration
  def change
    add_column :measures, :mass, :string
  end
end