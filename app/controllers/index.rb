class BrainStormer < Sinatra::Base

  get '/' do
    haml :index
  end

end
