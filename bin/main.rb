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
      @board.change_player
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

  # puts @display.print_board(@board.the_board)
  print @display.ask_user(@board.the_player)
  yes = @game.usr_input_validate?(gets.chomp)
  @position = yes

  if yes.is_a? Integer
    
    if @board.pos_valid?(@position)
      @board.update_board(@position)
      print @display.print_board(@board.the_board)
      if @board.won?
        win_method
      end
      draw_method if @board.draw?
    else
      puts @display.position_taken
    end
    @board.change_player
  
  else
  
    print @display.wrong_input
  
  end



end
