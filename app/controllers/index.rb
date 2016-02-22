class BrainStormer < Sinatra::Base
  get '/' do
    erb :index
  end
end
