require 'sinatra'
require 'sinatra/reloader'

number_guesser = NumberGuesser.new

get "/" do
  erb:index, :locals => {:secret_number => number_guesser.secret_number}
end

class NumberGuesser
  attr_reader :secret_number

  def initialize(max = 100)
    @secret_number = pick_secret_number(max)
  end

  def pick_secret_number(max)
    rand(max + 1)
  end

end
