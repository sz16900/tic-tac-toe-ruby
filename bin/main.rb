#!/usr/bin/env ruby

require_relative '../lib/display'
require_relative '../lib/board'
require_relative '../lib/game'

@display = Display.new
@board = Board.new
@position = nil
@game = Game.new

def win_method
  @game.scores[@board.the_player] += 1
  end_game_prompt
  end_game_handler
  true
end

def draw_method
  @game.scores['draws'] += 1
  end_game_prompt
  end_game_handler
  true
end

def end_game_handler
  loop do
    end_game_wrong
    yes = @game.play_again?(gets.chomp)
    if yes == true
      @board.reset_board
      @board.change_player
      break
    elsif yes == false
      @game_over = true
      end_game_prompt(true)
      break
    else
      end_game_wrong(true)
    end
  end
  true
end

def end_game_prompt(ends = nil)
  puts @display.print_board(@board.the_board)
  p @display.score_board(@game.scores)
  puts @display.end_game_message if ends == true
  true
end

def end_game_wrong(bad = nil)
  if bad == true
    print @display.wrong_input2(true)
    return true
  end
  print @display.wrong_input2
  true
end

until @game_over

  print @display.ask_user(@board.the_player)
  yes = @game.usr_input_validate?(gets.chomp)
  @position = yes

  if yes.is_a? Integer

    if @board.pos_valid?(@position)
      @board.update_board(@position)
      print @display.print_board(@board.the_board)
    else
      puts @display.position_taken
    end
    if @board.won?
      puts @display.player_wins(@board.the_player)
      win_method
    end
    if @board.draw?
      puts @display.draw
      draw_method
    end
    @board.change_player

  else

    print @display.wrong_input

  end

end
