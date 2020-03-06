class Display
  attr_reader :position

  def initialize
    @position = nil
  end

  def print_board(board)
    string_board = "\n"
    (0..2).each do |row|
      string_board += '|'
      (0..2).each do |col|
        string_board += board[row][col].to_s
        string_board += '|'
      end
      string_board += "\n"
    end
    string_board += "\n"
    string_board
  end

  def ask_user(player)
    str = "\n"
    str += "Ready Player #{player}?\n"
    str += 'Choose a number between 1 and 9: '
    str
  end

  def wrong_input
    str = "\n"
    str += "Wrong Input! Please try again.\n"
    str += 'Choose a number between 1 and 9: '
    str
  end

  def wrong_input2(input = nil)
    str = "\n"
    str += 'Play Again? y/n'
    if input == true
      str = "\n"
      str += "Wrong Input! Please try again.\n"
    end
    str
  end

  def position_taken
    str = "\n"
    str + 'Position taken! Please try again.'
  end

  def player_wins(player)
    s = "\n"
    s + "Player #{player} is the WINNER!!!\n"
  end

  def draw
    str = "\n"
    str += "It's a DRAW!!!\n"
    str
  end

  def score_board(player_hash)
    str = "Scores\n"
    player_hash.each do |k, v|
      str += "#{k} : #{v} \n"
    end
    str
  end
end
