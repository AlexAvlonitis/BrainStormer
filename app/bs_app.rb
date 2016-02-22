ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'controllers/init'
require_relative 'models/init'

class BrainStormer < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
