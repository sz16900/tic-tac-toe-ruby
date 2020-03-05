class Game
    attr_reader :scores

    def initialize
      @board = Board.new
      @display = Display.new
      @game_over = false
      @scores = { "X" => 0, "O" => 0, "draws" => 0 }
    end
  
    def start
      until @game_over
        puts @scores["X"]
        puts @scores["O"]
        puts @scores["draws"]
         
        @display.print_board(@board.the_board)
        @display.user_input(@board.the_player)
        if @board.pos_valid?(@display.position)
          @board.update_board(@display.position)
          if @board.won?
            @display.player_wins(@board.the_player)
            @display.print_board(@board.the_board)
            # @scores.key(@board.the_player) += 1
            # puts "Player has won this amount of times" + @scores[@board.the_player]
            @game_over = true
          elsif @board.draw?
            @scores[draws] += 1
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
  