require 'rubygems'
require 'rack/protection'
require 'dotenv'
Dotenv.load

require File.join(File.dirname(__FILE__), 'app/bs_app.rb')

run BrainStormer
