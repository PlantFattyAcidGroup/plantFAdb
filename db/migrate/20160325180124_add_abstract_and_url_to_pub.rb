class AddAbstractAndUrlToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :abstract, :string, limit: 4000
    add_column :pubs, :url, :string, limit: 1000
  end
end