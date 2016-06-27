class AddOldMolValToResults < ActiveRecord::Migration
  def change
    add_column :results, :old_mol_val, :decimal, precision: 8,  scale: 2
  end
end