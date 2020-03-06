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

  def user_input(player, usr_input)
    puts ''
    puts "Ready Player #{player}?"
    print 'Choose a number between 1 and 9: '
    # x = gets.chomp
    raise 'An Error' unless ('1'..'9').include? usr_input

    @position = usr_input.to_i
  rescue StandardError
    puts ''
    puts 'Wrong Input! Please try again.'
    retry
  end

  def position_taken
    puts ''
    puts 'Position taken! Please try again.'
  end

  def player_wins(player)
    s = "\n"
    s += "Player #{player} is the WINNER!!!"
  end

  def draw
    puts ''
    puts "It's a DRAW!!!"
  end

  def score_board(player_hash)
    puts 'Scores'
    player_hash.each do |k, v|
      puts "#{k} : #{v} "
    end
    puts ''
  end

  def play_again?
    puts 'Play Again? y/n'
    yes = gets.chomp
    if yes == 'y'
      false
    elsif yes == 'n'
      true
    else
      raise 'An error'
    end
  rescue StandardError
    puts ''
    puts 'Wrong Input! Please try again.'
    retry
  end
end
