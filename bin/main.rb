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

  def user_input(player)
    puts ''
    puts "Ready Player #{player}?"
    print 'Choose a number between 1 and 9: '
    x = gets.chomp
    raise 'An Error' unless ('1'..'9').include? x

    @position = x.to_i
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
    puts ''
    puts "Player #{player} is the WINNER!!!"
  end

  def draw
    puts ''
    puts "It's a DRAW!!!"
  end
end

class Board
  attr_reader :the_board, :the_player

  def initialize
    @the_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @the_player = 'X'
  end

  def change_player
    @the_player = @the_player == 'O' ? 'X' : 'O'
  end

  def pos_valid?(pos)
    row = (pos - 1) / 3
    col = (pos - 1) % 3
    if @the_board[row][col].is_a? Integer
      true
    else
      false
    end
  end

  def update_board(new_pos)
    row = (new_pos - 1) / 3
    col = (new_pos - 1) % 3
    @the_board[row][col] = @the_player
  end

  # draw methods
  def draw?
    (0..2).each do |x|
      return false if @the_board[x].any? Integer
    end
    true
  end

  # wining methods
  def won?
    return true if across1 || across2
    return true if sides_horizontal || sides_vertical

    false
  end

  def across1
    if @the_board[0][0] == @the_board[1][1] && @the_board[0][0] == @the_board[2][2] && @the_board[0][0] == @the_player
      return true
    end

    false
  end

  def across2
    if @the_board[0][2] == @the_board[1][1] && @the_board[0][2] == @the_board[2][0] && @the_board[0][2] == @the_player
      return true
    end

    false
  end

  def sides_horizontal
    (0..2).each do |i|
      if @the_board[i][0] == @the_board[i][1] && @the_board[i][0] == @the_board[i][2] && @the_board[i][0] == @the_player
        return true
      end
    end
    false
  end

  def sides_vertical
    (0..2).each do |i|
      if @the_board[0][i] == @the_board[1][i] && @the_board[0][i] == @the_board[2][i] && @the_board[0][i] == @the_player
        return true
      end
    end
    false
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
      @display.print_board(@board.the_board)
      @display.user_input(@board.the_player)
      if @board.pos_valid?(@display.position)
        @board.update_board(@display.position)
        if @board.won?
          @display.player_wins(@board.the_player)
          @display.print_board(@board.the_board)
          @game_over = true
        elsif @board.draw?
          @display.draw
          @display.print_board(@board.the_board)
          @game_over = true
        end
        @board.change_player
      else
        @display.position_taken
      end
    end
  end
end

g = Game.new
g.start
