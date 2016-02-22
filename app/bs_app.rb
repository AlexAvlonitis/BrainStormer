ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'Haml'
require 'JSON'

require_relative 'controllers/init'
require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'server'
