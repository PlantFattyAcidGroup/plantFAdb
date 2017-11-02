class AddTissueToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :tissue, :string
  end
end