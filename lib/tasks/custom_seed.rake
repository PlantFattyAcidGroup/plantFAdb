# Custom seed file
namespace :db do
  namespace :seed do
    task :single => :environment do
      filename = Dir[File.join(Rails.root, "/#{ENV['SEED']}")][0]
      puts "Seeding #{filename}..."
      load(filename) if File.exist?(filename)
    end
    task :reload_tree => :environment do
      puts "removing tree"
      puts TreeNode.destroy_all
      puts "Loading new tree"
      ENV['SEED']='db/seed_tree.rb'
      Rake::Task["db:seed:single"].invoke
    end
  end
end