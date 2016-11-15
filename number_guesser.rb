class NumberGuesser
  attr_reader :secret_number,
              :highest,
              :game_on

  def initialize(highest = 100)
    @highest = highest
    @game_on = false
    start_game
  end

  def pick_secret_number
    rand(highest + 1)
  end

  def start_game
    @secret_number = pick_secret_number
    @game_on = true
  end

  def way_too_high
    {"feedback" => "Way too high!",
    "secret_number" => ""}
  end

  def too_high
    {"feedback" => "Too high!",
    "secret_number" => ""}
  end

  def too_low
    {"feedback" => "Too low!",
    "secret_number" => ""}
  end

  def way_too_low
    {"feedback" => "Way too low!",
    "secret_number" => ""}
  end

  def you_got_it_right
    @game_on = false
    {"feedback" => "You got it right!",
    "secret_number" => "The SECRET NUMBER is #{secret_number}"}
  end

  def evaluation(guess)
    return way_too_high if guess.to_i > secret_number + 5
    return too_high if guess.to_i > secret_number
    return way_too_low if guess.to_i < secret_number - 5
    return too_low if guess.to_i < secret_number
    you_got_it_right
  end

end
