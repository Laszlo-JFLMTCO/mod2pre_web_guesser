require 'sinatra'
require 'sinatra/reloader'
require_relative 'number_guesser'

number_guesser = NumberGuesser.new

get "/" do
  guess_evaluation = number_guesser.evaluation(params["guess"])
  # throw guess_evaluation.inspect
  erb:index, :locals => {:last_guess => guess_evaluation["feedback"], :secret_number_message => guess_evaluation["secret_number"]}
end

