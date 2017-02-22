require 'httparty' #7bd14592a7e66067
require 'json'
require 'pry'

class Redis

  def cache(key)
    if (value = get(key)).nil?
      value = HTTParty.get(key)
      set(key, value.to_json)
      p 'from web'
      value.to_json
    else
      p 'from cache'
      value
    end
  end

end
