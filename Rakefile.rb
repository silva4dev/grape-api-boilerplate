require "yaml"
require "logger"
require "active_record"
require "sinatra/activerecord/rake"

include ActiveRecord::Tasks

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file"
    load @seed_file
  end
end

root = File.expand_path "..", __FILE__
DatabaseTasks.env = ENV["ENV"] || "development"
DatabaseTasks.database_configuration = YAML.load(File.read(File.join(root, "config/database.yml")))
DatabaseTasks.db_dir = File.join root, "db"
DatabaseTasks.fixtures_path = File.join root, "test/fixtures"
DatabaseTasks.migrations_paths = [File.join(root, "db/migrate")]
DatabaseTasks.seed_loader = Seeder.new File.join root, "db/seeds.rb"
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load "active_record/railties/databases.rake"