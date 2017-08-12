class AddBinomialNameToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :binomial_name, :string
    add_column :plants, :tnrs_name_submitted, :string
  end
end