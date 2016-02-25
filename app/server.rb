class BrainStormer < Sinatra::Base
  helpers CurrentUser
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, ENV['SESSION']
  use Rack::Protection

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "public") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
