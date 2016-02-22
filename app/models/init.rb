require 'rubygems'
require 'data_mapper'
require 'dm-validations'

require_relative 'user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/brainstormer_#{ENV['RACK_ENV']}")
DataMapper.finalize
