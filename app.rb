require 'sinatra'
require "redis"
require 'pry'

get '/hi' do
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  REDIS.set("foo", "bar")
  REDIS.get("foo")
end
