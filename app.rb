require 'sinatra'
require "redis"
require 'pry'
require 'json'

post '/ci' do
  uri = URI.parse(ENV["REDISTOGO_URL"])
  redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  redis.publish 'orchestra:builds', request.body.read
  "data published"
end
