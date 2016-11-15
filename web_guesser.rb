require 'sinatra'

get "/" do
  "The secret number is #{pick_secret_number}"
end

def pick_secret_number(max = 100)
  rand(max + 1)
end