require 'sinatra'
require 'sinatra/reloader'
require_relative 'number_guesser'

number_guesser = NumberGuesser.new

get "/" do
  guess_evaluation = number_guesser.evaluation(params["guess"].to_i, params["cheat"])
  erb:index, :locals => {:last_guess => guess_evaluation[:last_guess],
                         :secret_number_message => guess_evaluation[:secret_number_message],
                         :color => guess_evaluation[:color]}
end
