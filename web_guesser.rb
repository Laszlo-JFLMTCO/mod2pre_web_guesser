require 'sinatra'
require 'sinatra/reloader'

get "/" do
  "The SECRET NUMBER is #{pick_secret_number}"
end

def pick_secret_number(max = 100)
  rand(max + 1)
end