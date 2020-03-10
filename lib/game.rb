class Game
  attr_reader :scores

  def initialize
    @scores = { 'X' => 0, 'O' => 0, 'draws' => 0 }
  end

  def usr_input_validate?(input)
    return input.to_i if ('1'..'9').cover? input

    false
  end

  def play_again?(yes)
    if yes == 'y'
      true
    elsif yes == 'n'
      false
    else
      'An error'
    end
  end
end
