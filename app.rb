require_relative 'lib/weather'
require_relative 'lib/helpers'
require_relative 'lib/display'
require 'pry'

def main
  redis
  
  display_input_prompt
  location = get_user_input

  weather_data = ['conditions', 'forecast10day', 'alerts', 'astronomy', 'currenthurricane']

  weather_data.each do |data_point|
    method_call = data_point.gsub(/( "|" )/, ' ')
    method_call = get_response(redis, data_point, location)
    display_call = data_point.gsub(/( "|" )/, ' ')
    display = 'display_' << display_call
    send(display, method_call)
  end
end

main if __FILE__ == $PROGRAM_NAME
