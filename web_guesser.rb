require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

set :secret_number_empty, ""
set :secret_number, Proc.new {"The SECRET NUMBER is " + SECRET_NUMBER}
set :too_high, "Too high!"
set :way_too_high, "Way too high!"
set :too_low, "Too low!"
set :way_too_low, "Way too low!"
set :you_got_it_right, "You got it right!"

get "/" do
  guess = params["guess"].to_i
  feedback = {}
  feedback[:secret_number_message] = settings.secret_number_empty
  feedback[:last_guess] = settings.too_high if guess > SECRET_NUMBER
  feedback[:last_guess] = settings.way_too_high if guess > SECRET_NUMBER + 5
  feedback[:last_guess] = settings.too_low if guess < SECRET_NUMBER
  feedback[:last_guess] = settings.way_too_low if guess < SECRET_NUMBER - 5
  feedback[:last_guess] = settings.you_got_it_right if guess == SECRET_NUMBER
  feedback[:secret_number_message] = settings.secret_number_empty if guess == SECRET_NUMBER
  erb:index, :locals => {:last_guess => feedback[:last_guess], :secret_number_message => feedback[:secret_number_message]}
end

