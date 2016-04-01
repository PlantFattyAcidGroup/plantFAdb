class AddWosToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :wos_uid, :string
    add_column :pubs, :wos_journal, :string
    add_column :pubs, :wos_title, :string, limit: 500
    add_column :pubs, :wos_volume, :string
    add_column :pubs, :wos_authors, :string
    add_column :pubs, :wos_pages, :string
    add_column :pubs, :wos_year, :string
    add_column :pubs, :doi, :string
  end
end