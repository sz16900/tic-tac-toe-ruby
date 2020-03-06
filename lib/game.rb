class Game
  attr_reader :scores

  def initialize
    @scores = { 'X' => 0, 'O' => 0, 'draws' => 0 }
  end

  def usr_input_validate?(input)
    if ('1'..'9').include? input
      return input.to_i
    else
      false
    end
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
