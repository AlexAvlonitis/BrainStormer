ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require "sinatra/json"
require 'sinatra/partial'
require 'Haml'
require 'json'

require_relative 'routes/init'
require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'server'
