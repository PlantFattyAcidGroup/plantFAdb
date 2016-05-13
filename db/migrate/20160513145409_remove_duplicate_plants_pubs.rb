class RemoveDuplicatePlantsPubs < ActiveRecord::Migration
  def up
    Pub.transaction do
      Pub.find_each do |p|
        next unless p.plants.length > p.plants.uniq.length
        puts "Working on Pub::#{p.id} (#{p.plants.length}-#{p.plants.uniq.length})"
        uniq_p = p.plants.uniq
        p.plants_pubs.destroy_all
        p.reload
        p.plants=uniq_p
        puts "-- new count #{p.reload.plants.length}\n"
      end
    end
  end
end
