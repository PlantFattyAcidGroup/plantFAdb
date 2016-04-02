class AddCommonNameToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :common_name, :string
  end
end