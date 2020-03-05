class Game
  attr_reader :scores

  def initialize
    @board = Board.new
    @display = Display.new
    @game_over = false
    @scores = { 'X' => 0, 'O' => 0, 'draws' => 0 }
  end

  def start
    until @game_over

      @display.print_board(@board.the_board)
      @display.user_input(@board.the_player)
      if @board.pos_valid?(@display.position)
        @board.update_board(@display.position)
        if @board.won?
          @display.player_wins(@board.the_player)
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
