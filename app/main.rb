require_relative "../api/user.rb"

module App
  class Main < Grape::API
    format :json
    prefix :api

    mount ::API::User
  end
end