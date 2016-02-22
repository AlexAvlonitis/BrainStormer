ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'JSON'

require_relative 'controllers/init'
require_relative 'models/init'
require_relative 'helpers/init'

class BrainStormer < Sinatra::Base
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb

  enable :sessions
  set :session_secret, ENV['SESSION']
  use Rack::Protection

  set :views, Proc.new { File.join(root, "../views") }
  set :public_folder, File.dirname(__FILE__) + '/public'

  # start the server if ruby file executed directly
  run! if app_file == $0
end
