class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :type
      t.string :delta_notation
      t.string :cas_number
      t.string :sofa_mol_id

      t.timestamps null: false
    end
  end
end
