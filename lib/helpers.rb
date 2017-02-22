require_relative 'redis_cache'
require 'pry'

def redis
  redis = Redis.new
end

def get_user_input
  input = gets.chomp
  process_input(input)
end

def process_input(input)
  input.to_i == 0 ? invalid_int : input.to_i
end

def invalid_int
  puts 'Please enter a valid 5 digit zipcode'
  get_user_input
end
