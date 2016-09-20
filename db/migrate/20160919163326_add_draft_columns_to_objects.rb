class AddDraftColumnsToObjects < ActiveRecord::Migration
  def change
    add_column :measures, :draft_id, :integer
    add_column :measures, :published_at, :timestamp
    add_column :measures, :trashed_at, :timestamp
    
    add_column :plants, :draft_id, :integer
    add_column :plants, :published_at, :timestamp
    add_column :plants, :trashed_at, :timestamp
    
    add_column :pubs, :draft_id, :integer
    add_column :pubs, :published_at, :timestamp
    add_column :pubs, :trashed_at, :timestamp
    
    add_column :plants_pubs, :draft_id, :integer
    add_column :plants_pubs, :published_at, :timestamp
    add_column :plants_pubs, :trashed_at, :timestamp
    
    add_column :results, :draft_id, :integer
    add_column :results, :published_at, :timestamp
    add_column :results, :trashed_at, :timestamp
    
    Measure.update_all(published_at: Time.now)
    Plant.update_all(published_at: Time.now)
    Pub.update_all(published_at: Time.now)
    PlantsPub.update_all(published_at: Time.now)
    Result.update_all(published_at: Time.now)
  end
end