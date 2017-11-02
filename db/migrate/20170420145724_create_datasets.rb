class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :remarks
      t.string :notes
      t.string :source
      t.string :sofa_tab_id
      t.references :plants_pub
      t.timestamps
    end
    add_column :results, :dataset_id, :integer
  end
end