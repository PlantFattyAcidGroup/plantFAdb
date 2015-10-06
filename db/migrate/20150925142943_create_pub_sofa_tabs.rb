class CreatePubSofaTabs < ActiveRecord::Migration
  def change
    create_table :sofa_tabs do |t|
      t.integer :pub_id
      t.string :sofa_tab_id
    end
  end
end
