class AddPlantsPubIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :plants_pub_id, :integer
    change_table :plants_pubs do |t|
      t.index :plant_id
      t.index :pub_id
    end

    reversible do |dir|
      dir.up do
        PaperTrail.enabled=false
        if Result.count > 0
          pbar = ProgressBar.new(Result.count)
          tables = []
          ActiveRecord::Base.uncached do
            Result.find_each do |r|
              if r.plant_id.blank? || r.pub_id.blank?
                puts "invalid result: #{r.inspect}"
                next
              end
              tables = PlantsPub.where(plant_id: r.plant_id, pub_id: r.pub_id)
              unless tables.length ==1
                puts "table count invalid: #{tables.length}\n#{r.inspect}"
                next
              end
              r.update_attribute(:plants_pub_id, tables.first.id)
              pbar.increment!
            end
          end
        end
      end
    end
  end
end