class AddNoteToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :note, :string
  end
end