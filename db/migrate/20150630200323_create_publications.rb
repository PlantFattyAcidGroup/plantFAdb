class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :year
      t.string :authors
      t.string :journal
      t.string :volume
      t.string :page
      t.string :remarks
      t.belongs_to :plant, index: true

      t.timestamps null: false
    end
  end
end
