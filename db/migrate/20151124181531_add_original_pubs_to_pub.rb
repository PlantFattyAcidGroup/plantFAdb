class AddOriginalPubsToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :original_pubs, :text
  end
end