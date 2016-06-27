class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.decimal :value, precision: 8,  scale: 2
      t.string :unit
      t.references :measure, index: true, foreign_key: true
      t.references :publication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
