class Board
  attr_reader :the_board, :the_player

  def initialize
    @the_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @the_player = 'X'
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
    true
  end

  # draw methods
  def draw?
    (0..2).each do |x|
      return false if @the_board[x].any? Integer
    end
    true
  end

  # winning methods
  def won?
    return true if across1 || across2 || sides_horizontal || sides_vertical

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

  def reset_board
    @the_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    change_player
    true
  end

  def change_player
    @the_player = @the_player == 'O' ? 'X' : 'O'
    true
  end
end
