# Custom seed file
namespace :db do
  namespace :seed do
    task :single => :environment do
      filename = Dir[File.join(Rails.root, "/#{ENV['SEED']}")][0]
      puts "Seeding #{filename}..."
      load(filename) if File.exist?(filename)
    end
  end
end