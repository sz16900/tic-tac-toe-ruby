#!/usr/bin/env ruby

require_relative '../lib/display'
require_relative '../lib/board'
require_relative '../lib/game'

@display = Display.new
@board = Board.new
@position = nil
@game = Game.new

def win_method
  puts @display.player_wins(@board.the_player)
  @game.scores[@board.the_player] += 1
  end_game_handler
  true
end

def draw_method
  puts @display.draw
  @game.scores['draws'] += 1
  end_game_handler
  true
end

def end_game_handler
  puts @display.print_board(@board.the_board)
  puts @display.score_board(@game.scores)
  loop do
    print @display.wrong_input2
    yes = @game.play_again?(gets.chomp)
    if yes == true
      @board.reset_board
      break
    elsif yes == false
      @game_over = true
      puts @display.end_game_message
      break
    else
      print @display.wrong_input2(true)
    end
  end
  true
end

until @game_over

  puts @display.print_board(@board.the_board)
  print @display.ask_user(@board.the_player)

  loop do
    yes = @game.usr_input_validate?(gets.chomp)
    @position = yes
    break if yes.is_a? Integer

    print @display.wrong_input
  end

  if @board.pos_valid?(@position)
    @board.update_board(@position)
    win_method if @board.won?
    draw_method if @board.draw?
  else
    puts @display.position_taken
  end
end
