ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require "sinatra/json"
require 'sinatra/partial'
require 'rest-client'
require 'json'
require 'haml'

require_relative 'routes/init'
require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'server'
