require_relative '../lib/display'

RSpec.describe Display do
  let(:displays) { Display.new }
  describe '#print_board' do
    it 'returns a string of the board' do
      expect(displays.print_board([[1, 2, 3], [4, 5, 6], [7, 8, 9]])).to eql("\n|1|2|3|\n|4|5|6|\n|7|8|9|\n\n")
    end
  end
  describe '#ask_user' do
    it 'returns a string with the player\'s name' do
      expect(displays.ask_user('X')).to eql("\nReady Player X?\nChoose a number between 1 and 9: ")
    end
  end

  describe '#wrong_input' do
    it 'returns a string prompting wrong information' do
      expect(displays.wrong_input).to eql("\nWrong Input! Please try again.\nChoose a number between 1 and 9: ")
    end
  end

  describe '#wrong_input2' do
    it 'returns a string prompting wrong information with optional parameter' do
      expect(displays.wrong_input2(true)).to eql("\nWrong Input! Please try again.\n")
    end
    it 'returns a string prompting to play again' do
      expect(displays.wrong_input2).to eql("\nPlay Again? y/n: ")
    end
  end
  describe '#position_taken' do
    it 'returns a string prompting a posiion already in place' do
      expect(displays.position_taken).to eql("\nPosition taken! Please try again.")
    end
  end
  describe '#player_wins' do
    it 'returns the winner of the match in a string' do
      expect(displays.player_wins('O')).to eql("\nPlayer O is the WINNER!!!\n")
    end
  end
  describe '#draw' do
    it 'returns a string when draw match' do
      expect(displays.draw).to eql("\nIt's a DRAW!!!\n")
    end
  end
  describe '#score_board' do
    scores = { 'X' => 0, 'O' => 0, 'draws' => 0 }
    it 'returns the score board of multiple matched played' do
      expect(displays.score_board(scores)).to eql("Scores\nX : 0 \nO : 0 \ndraws : 0 \n")
    end
  end
  describe '#end_game_message' do
    it 'returns a string with a farewell message' do
      expect(displays.end_game_message).to eql("\nThank you for playing. \nGOODBYE! \n\n")
    end
  end
end
