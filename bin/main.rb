#!/usr/bin/env ruby

class Display
  attr_reader :position

  def initialize
    @position = nil
  end

  def print_board(board)
    puts ''
    (0..2).each do |row|
      print '|'
      (0..2).each do |col|
        print board[row][col]
        print '|'
      end
      puts ''
    end
    puts ''
  end

  def user_input
    print 'Choose a number between 1 and 9: '
    x = gets.chomp
    raise 'An Error' unless ('1'..'9').include? x
    # raise 'Another Error' if x == 'X' || x == 'O'


    @position = x.to_i

  rescue StandardError
    puts 'Wrong Input! Please try again.'
    retry
  end

  def position_taken
    puts "Position taken! Please try again."
  end
end

class Board
  attr_reader :the_board, :the_player

  def initialize
    @the_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @the_player = "X"
  end

  def change_player
    @the_player = @the_player == 'O' ? 'X' : 'O'
  end

  def pos_valid?(pos)
    row = (pos - 1) / 3
    col = (pos - 1) % 3
    if @the_board[row][col].is_a? Integer
      return true
    else
      return false
    end
  end

  def update_board(new_pos) 
    row = (new_pos - 1) / 3
    col = (new_pos - 1) % 3
    @the_board[row][col] = @the_player
  end
end

class Game
  def initialize
    @board = Board.new
    @display = Display.new
    @game_over = false
  end

  def start
    until @game_over
      # game_over = true if wins || draws
      @display.print_board(@board.the_board)
      @display.user_input
      if @board.pos_valid?(@display.position)
        @board.update_board(@display.position)
        @board.change_player
      else
        @display.position_taken
      end
      # @display.print_board(@board.the_board)
      
      # @game_over = true
    end
  end
end

g = Game.new
g.start
