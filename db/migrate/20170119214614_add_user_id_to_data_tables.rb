class AddUserIdToDataTables < ActiveRecord::Migration
  def change
    add_column :plants_pubs, :user_id, :integer
    add_column :plants, :user_id, :integer
    add_column :measures, :user_id, :integer
    add_column :pubs, :user_id, :integer
  end
end