class AddOrderToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :order_name, :string
  end
end