class AddFieldsToPlants < ActiveRecord::Migration
  def self.up
    add_column :plants, :variety, :string
    add_column :plants, :tissue, :string, default: 'Unknown'
  end

  def self.down
    remove_column :plants, :variety
    remove_column :plants, :tissue
  end
end
