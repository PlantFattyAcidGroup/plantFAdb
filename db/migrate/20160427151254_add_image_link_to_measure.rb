class AddImageLinkToMeasure < ActiveRecord::Migration
  def change
    add_column :measures, :image_link, :string
  end
end