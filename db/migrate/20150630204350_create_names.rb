class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :type
      t.string :name
      t.references :measure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
