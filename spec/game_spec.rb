require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }
  describe '#play_again?' do
    it 'returns true if input is y' do
      expect(game.play_again?('y')).to eql(true)
    end

    it 'returns false if input is n' do
      expect(game.play_again?('n')).to eql(false)
    end

    it 'returns \'An error\' if input is neither y / n' do
      expect(game.play_again?('blabla')).to eql('An error')
    end
  end

  describe '#usr_input_validate?' do
    it 'validates and returns the user\'s input from 1 to 9' do
      expect(game.usr_input_validate?('1')).to eql(1)
    end

    it 'validates and returns the user\'s input from 1 to 9' do
      expect(game.usr_input_validate?('99')).to eql(false)
    end

    it 'validates and returns the user\'s input from 1 to 9' do
      expect(game.usr_input_validate?('awesome')).to eql(false)
    end
  end
end
