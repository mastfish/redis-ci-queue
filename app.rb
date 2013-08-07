require 'sinatra'
require "redis"
require 'pry'

post '/ci' do
  uri = URI.parse(ENV["REDISTOGO_URL"])
  redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  data = {this: true}
  redis.publish 'orchestra:builds', data.to_json
end
