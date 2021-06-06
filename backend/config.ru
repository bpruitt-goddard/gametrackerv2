require 'rack/unreloader'

dev = ENV['RACK_ENV'] ||= 'development'

Unreloader = Rack::Unreloader.new(:subclasses=>%w'Roda'){App}
Unreloader.require './app.rb'

run(dev ? Unreloader : App)
