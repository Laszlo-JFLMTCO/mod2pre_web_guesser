class NumberGuesser
  attr_reader :secret_number,
              :highest,
              :game_on,
              :max_guess,
              :guess_count

  def initialize(highest = 100, max_guess = 5)
    @highest = highest
    @max_guess = max_guess
    @game_on = false
    start_game
  end

  def pick_secret_number
    rand(highest + 1)
  end

  def start_game
    @secret_number = pick_secret_number
    @game_on = true
    @guess_count = max_guess
  end

  def show_number(cheat)
    return "" unless cheat
    "The SECRET NUMBER is #{secret_number}."
  end

  def way_too_high(cheat)
    @guess_count -= 1
    {:last_guess => "Way too high!",
    :secret_number_message => show_number(cheat),
    :color => "red"}
  end

  def too_high(cheat)
    @guess_count -= 1
    {:last_guess => "Too high!",
    :secret_number_message => show_number(cheat),
    :color => "violet"}
  end

  def too_low(cheat)
    @guess_count -= 1
    {:last_guess => "Too low!",
    :secret_number_message => show_number(cheat),
    :color => "violet"}
  end

  def way_too_low(cheat)
    @guess_count -= 1
    {:last_guess => "Way too low!",
    :secret_number_message => show_number(cheat),
    :color => "red"}
  end

  def you_got_it_right
    @game_on = false
    output = {:last_guess => "You WON!!! You got it right!",
    :secret_number_message => "The SECRET NUMBER is #{secret_number}.",
    :color => "green"}
    start_game
    output
  end

  def you_lost(cheat)
    start_game
    {:last_guess => "You lost! I thought of a new number now...",
    :secret_number_message => show_number(cheat),
    :color => "red"}
  end

  def evaluation(guess, cheat)
    return you_lost(cheat) if guess_count == 0
    return way_too_high(cheat) if guess.to_i > secret_number + 5
    return too_high(cheat) if guess.to_i > secret_number
    return way_too_low(cheat) if guess.to_i < secret_number - 5
    return too_low(cheat) if guess.to_i < secret_number
    you_got_it_right
  end

end
