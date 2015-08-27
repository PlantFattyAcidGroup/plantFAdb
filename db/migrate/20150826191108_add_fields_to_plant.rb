class AddFieldsToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :note, :string, limit: 3999
    add_column :plants, :tnrs_match, :string
    add_column :plants, :name_status, :string
    rename_column :plants, :name, :sofa_name
    rename_column :plants, :family, :sofa_family
    add_column :plants, :family, :string
    add_column :plants, :genus, :string
    add_column :plants, :species, :string
    add_column :plants, :tropicos_url, :string
    add_column :plants, :ott_id, :integer
    add_column :plants, :accepted_rank, :string
    add_column :plants, :matched_rank, :string
  end
end