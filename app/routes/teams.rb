class BrainStormer < Sinatra::Base


  get '/teams/:id' do
    haml :team
  end

end
