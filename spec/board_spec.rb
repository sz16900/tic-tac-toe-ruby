require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 'X') }
  describe '#pos_valid?' do
    it 'return true if position is valid' do
      expect(board.pos_valid?(2)).to eql(true)
    end

    it 'Is the tic-tac-toe position already taken?' do
      board.update_board(3)
      expect(board.pos_valid?(3)).to eql(false)
    end
  end

  describe '#update_board' do
    it 'updating the board' do
      board.update_board(4)
      expect(board.the_board).to eql([[1, 2, 3], ['X', 5, 6], [7, 8, 9]])
    end

    it 'updating the board some more' do
      board.update_board(4)
      board.update_board(5)
      expect(board.the_board).to eql([[1, 2, 3], ['X', 'X', 6], [7, 8, 9]])
    end
  end

  describe '#draw?' do
    it 'is it a draw?' do
      expect(board.draw?).to eql(false)
    end

    it 'is it a draw? (with array)' do
      b = Board.new([%w[X O X], %w[X O O], %w[O X X]], 'O')
      expect(b.draw?).to eql(true)
    end
  end

  describe '#won?' do
    it 'did I win?' do
      b = Board.new([%w[X O X], ['X', 4, 'O'], %w[O X X]], 'O')
      expect(b.won?).to eql(false)
    end

    it 'did I win Now?' do
      b2 = Board.new([%w[X X X], ['X', 4, 'O'], %w[O X X]], 'X')
      expect(b2.won?).to eql(true)
    end
  end

  describe '#across1' do
    it 'did I win across (part I: left to bottom-right)' do
      b3 = Board.new([%w[X O X], %w[X X O], %w[O X X]], 'X')
      expect(b3.across1).to eql(true)
    end
  end

  describe '#across2' do
    it 'did I win across (part II: left to top-right)' do
      b4 = Board.new([%w[X O X], %w[X X O], %w[X X O]], 'X')
      expect(b4.across2).to eql(true)
    end
  end

  describe '#sides_horizontal' do
    it 'did I win horizontally?' do
      b5 = Board.new([%w[X O X], %w[X X X], %w[O X O]], 'X')
      expect(b5.sides_horizontal).to eql(true)
    end
  end

  describe '#sides_vertical' do
    it 'did I win vertically?' do
      b6 = Board.new([%w[X O X], %w[X O X], %w[X X O]], 'X')
      expect(b6.sides_vertical).to eql(true)
    end
  end

  describe '#reset_board' do
    it 'is the board reset?' do
      b7 = Board.new([%w[X O X], %w[X O X], %w[X X O]], 'X')
      b7.reset_board
      expect(b7.the_board).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe '#change_player' do
    it 'was the player changed?' do
      b8 = Board.new([%w[X O X], %w[X O X], %w[X X O]], 'X')
      b8.change_player
      expect(b8.the_player).to eql('O')
    end
  end
end
