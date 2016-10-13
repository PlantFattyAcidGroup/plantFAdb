class AddIupacToFa < ActiveRecord::Migration
  def change
    add_column :measures, :iupac_name, :string
  end
end