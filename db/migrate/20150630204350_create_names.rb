class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :type
      t.string :name
      t.references :measure

      t.timestamps null: false
    end
  end
end
