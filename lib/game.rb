class Game
  attr_reader :scores

  def initialize
    @board = Board.new
    @display = Display.new
    @game_over = false
    @scores = { 'X' => 0, 'O' => 0, 'draws' => 0 }
    @postion = nil
  end

  def usr_input_validate?(x)
    if ('1'..'9').include? x
      @position = x.to_i
      return true
    else
     return false
    end
  end

  def start
    until @game_over

      puts @display.print_board(@board.the_board)
      print @display.ask_user(@board.the_player)

      loop do 
        yes = usr_input_validate?(gets.chomp)
        if yes == true
          break
        else 
          print @display.wrong_input
        end
      end 

      if @board.pos_valid?(@position)
        @board.update_board(@position)
        if @board.won?
          puts @display.player_wins(@board.the_player)
          @scores[@board.the_player] += 1
          end_game_handler
        elsif @board.draw?
          @scores['draws'] += 1
          @display.draw
          end_game_handler
        end
        @board.change_player
      else
        @display.position_taken
      end
    end
  end

  private

  def end_game_handler
    @display.print_board(@board.the_board)
    @display.score_board(@scores)
    @game_over = @display.play_again?
    @board.reset_board
  end
end
