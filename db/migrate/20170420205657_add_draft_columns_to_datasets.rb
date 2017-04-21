class AddDraftColumnsToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :draft_id, :integer
    add_column :datasets, :published_at, :timestamp
    add_column :datasets, :trashed_at, :timestamp
  end
end
