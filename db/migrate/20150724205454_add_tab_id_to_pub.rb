class AddTabIdToPub < ActiveRecord::Migration
  def change
    add_column :publications, :sofa_tab_id, :string
  end
end