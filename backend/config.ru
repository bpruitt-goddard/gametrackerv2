require_relative 'db'
require 'sequel/model'
require 'rack/unreloader'

dev = ENV['RACK_ENV'] ||= 'development'

Unreloader = Rack::Unreloader.new(:subclasses=>%w'Roda'){App}
Unreloader.require './app.rb'
Unreloader.require('models') {}

run(dev ? Unreloader : App)
