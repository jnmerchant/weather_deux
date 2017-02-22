require 'pry'

class Redis

  def cache(key, passed_value)
    if (value = key).nil?
      value = passed_value
      set(key, value.to_json)
      p 'from setting'
      value.to_json
    else
      p 'from cache'
      value
    end
  end

end
