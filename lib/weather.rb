require 'redis'
require 'json'
require 'pry'

def get_response(redis, calling_function, location=nil)
  url = "http://api.wunderground.com/api/7bd14592a7e66067/#{calling_function}/q/#{location}.json"

  response = redis.cache(url)
  JSON.parse(response)
end
