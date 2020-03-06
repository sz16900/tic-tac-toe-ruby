class Game
  attr_reader :scores

  def initialize
    @board = Board.new
    @display = Display.new
    @game_over = false
    @scores = { 'X' => 0, 'O' => 0, 'draws' => 0 }
    @postion = nil
  end

  def usr_input_validate?(input)
    if ('1'..'9').include? input
      @position = input.to_i
      true
    else
      false
    end
  end

  def start
    until @game_over

      puts @display.print_board(@board.the_board)
      print @display.ask_user(@board.the_player)

      loop do
        yes = usr_input_validate?(gets.chomp)
        break if yes == true

        print @display.wrong_input
      end

      if @board.pos_valid?(@position)
        @board.update_board(@position)
        if @board.won?
          puts @display.player_wins(@board.the_player)
          @scores[@board.the_player] += 1
          end_game_handler
        elsif @board.draw?
          @scores['draws'] += 1
          puts @display.draw
          end_game_handler
        end
        @board.change_player
      else
        puts @display.position_taken
      end
    end
  end

  def play_again?(yes)
    if yes == 'y'
      true
    elsif yes == 'n'
      false
    else
      'An error'
    end
  end

  private

  def end_game_handler
    @display.print_board(@board.the_board)
    @display.score_board(@scores)
    loop do
      print @display.wrong_input2
      yes = play_again?(gets.chomp)
      if yes == true
        @board.reset_board
        break
      elsif yes == false
        @game_over = true
        break
      else
        print @display.wrong_input2(true)
      end
    end
  end
end
