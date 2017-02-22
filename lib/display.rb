require 'pry'

def display_input_prompt
  puts 'Enter a 5 digit zipcode and get some weather info: '
end

def display_conditions(conditions)
  puts "-----------------------------------------------------------------------"
  current = conditions["current_observation"]
  puts "The current conditions in #{current["display_location"]["full"]} as of"
  puts "#{current["observation_time_rfc822"]} are:"
  puts "Weather - #{current["weather"]}"
  puts "Temp - #{current["temperature_string"]}"
  puts "Relative Humidity - #{current["relative_humidity"]}"
  puts "Wind - #{current["wind_string"]}"
  puts "-----------------------------------------------------------------------"
  sleep(5)
end

def display_forecast10day(forecast10day)
  forecast = forecast10day["forecast"]["simpleforecast"]["forecastday"]
  forecast.each do |day|
    date = day["date"]
    puts ""
    puts "Forecast for #{date["monthname"]} - #{date["weekday"]}, #{date["day"]}, #{date["year"]}"
    puts "Conditions - #{day["conditions"]}"
    puts "High - #{day["high"]["fahrenheit"]}"
    puts "Low = #{day["low"]["fahrenheit"]}"
    puts ""
  end
  puts "-----------------------------------------------------------------------"
  sleep(5)
end

def display_alerts(alerts)
  number_of_alerts = alerts["alerts"].length
  if number_of_alerts == 0
    puts "There are no current weather alerts."
    puts "---------------------------------------------------------------------"
  else
    puts "Weather Alerts:"
    i = 0
    number_of_alerts.times do
      alerts = alerts["alerts"][i]

      puts "Current alert - #{alerts["description"]}"
      puts "Message: #{alerts["message"]}"
      puts "Expires - #{alerts["expires"]}"
      i += 1
    end
    puts "---------------------------------------------------------------------"
  end
  sleep(5)
end

def display_astronomy(astronomy)
  sunrise = astronomy["moon_phase"]["sunrise"]
  sunset = astronomy["moon_phase"]["sunset"]

  puts "Sunrise - #{sunrise["hour"]}:#{sunrise["minute"]}"
  puts "Sunset - #{sunset["hour"]}:#{sunset["minute"]}"
  puts "-----------------------------------------------------------------------"
end

def display_currenthurricane(currenthurricane)
  number_of_hurricanes = currenthurricane["currenthurricane"].length
  if number_of_hurricanes == 0
    puts "There are no current hurricanes impacting the US."
  else
    puts "Hurricanes:"
    i = 0
    number_of_hurricanes.times do
      hurricane = currenthurricane["currenthurricane"][i]["stormInfo"]
      puts "Storm - #{hurricane["stormName_Nice"]}"
      i += 1
    end
  end
end
