class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :year
      t.string :authors
      t.string :journal
      t.string :volume
      t.string :page
      t.string :remarks
      t.timestamps null: false
    end
  end
end
