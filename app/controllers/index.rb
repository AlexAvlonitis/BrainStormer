class BrainStormer < Sinatra::Base

  get '/' do
    haml :index
  end

  get '/users' do
    @user = 'greask'
    haml :users
  end

end
