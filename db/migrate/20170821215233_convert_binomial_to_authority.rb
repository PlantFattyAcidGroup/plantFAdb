class ConvertBinomialToAuthority < ActiveRecord::Migration
  def change
    rename_column :plants, :binomial_name, :authority
  end
end