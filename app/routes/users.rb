class BrainStormer < Sinatra::Base

  get '/register' do
    haml :register
  end

end
