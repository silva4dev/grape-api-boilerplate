require "rack"
require "grape"
require "active_record"

require_relative "./app/main.rb"

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "development.sqlite3")

Rack::Handler.default.run(App::Main, :Port => 3000)