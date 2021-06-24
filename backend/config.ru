require_relative 'db'
require 'sequel/model'
require 'rack/unreloader'
require 'rack/cors'

dev = ENV['RACK_ENV'] ||= 'development'

Unreloader = Rack::Unreloader.new(:subclasses=>%w'Roda'){App}
Unreloader.require './app.rb'
Unreloader.require('models') {}

use Rack::Cors do
    allowed_methods = %i[get post put delete options head]
    allow do
      origins "#{ENV['FRONTEND_URL']}"
      resource '*',
      headers: :any,
      methods: allowed_methods
    end
end

run(dev ? Unreloader : App)
