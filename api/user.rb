module API
  class User < Grape::API
    get '/users' do
      { user: 'users' }
    end
  end
end