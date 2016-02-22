class BrainStormer < Sinatra::Base

  get '/' do
    layout = partial :layout
  end

end
