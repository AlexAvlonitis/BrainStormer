class BrainStormer < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users' do
    @user = 'alex'
    erb :users
  end

end
