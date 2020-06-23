require './lib/board.rb'
require './lib/helpers.rb'
require './lib/player.rb'
require './lib/string.rb'

describe Board do
  let(:board) { Board.new }
  describe '#initialize' do
    it 'It initializes an array with 9 cells' do
      expect(board.board.size).to eq 9
    end

    it 'Board must start off with Integers only.' do
      expect(board.board.map(&:class)).to eql([Integer] * 9)
    end

    it 'Board must contain values between 1 and 9 only.' do
      expect(board.board.all? { |_i| _i = (1..9) }).not_to eql(false)
    end
  end

  describe '#update_board' do
    it 'Should add the correct symbol to a position.' do
      expect(board.update_board(0, 'X')).not_to eql('O')
    end

    it 'Should add a symbol to a position.' do
      expect(board.update_board(1, 'O')).to eql('O')
    end

    it 'Should raise TypeError if given Invalid Argument.' do
      expect { board.update_board('X', 'O') }.to raise_error(TypeError)
    end
  end

  describe '#move_made?' do
    it 'Check if the move has already been made.' do
      board.board[1] = 'X'
      expect(board.move_made?(1)).to eql(true)
    end

    it 'Return false if input in move made is not X or O.' do
      board.board[2] = 'G'
      expect(board.move_made?(2)).not_to eql(true)
    end

    it 'Require X and O to be uppercase only.' do
      board.board[3] = 'o'
      expect(board.move_made?(3)).to eql(false)
    end
  end

  describe '#input_valid?' do
    let(:rand_string) { 'IM AN Int ;)' }
    it 'checks if input is between 1 - 9 (Integer)' do
      expect(board.input_valid?(5)).to eql(true)
    end

    it 'Return false if input is greater than 9.' do
      expect(board.input_valid?(55)).not_to eql(true)
    end

    it 'Return false if input is not an Integer.' do
      expect(board.input_valid?(rand_string)).not_to eql(true)
    end
  end

  describe '#win_cond_row? ' do
    it 'Checks if a player has won by completing a row' do
      board.board[0] = 'X'
      board.board[1] = 'X'
      board.board[2] = 'X'
      expect(board.win_cond_row?).not_to eql(false)
    end

    it 'Returns true only if the player symbols are the same. ' do
      board.board[0] = 'X'
      board.board[1] = 'x'
      board.board[2] = 'O'
      expect(board.win_cond_row?).to eql(false)
    end

    it 'Only accepts values matching a row.' do
      board.board[2] = 'O'
      board.board[3] = 'O'
      board.board[4] = 'O'
      expect(board.win_cond_row?).to eql(false)
    end
  end

  describe '#win_cond_col?' do
    it '#win_cond_col? checks if a player has won by completing a column' do
      board.board[2] = 'X'
      board.board[5] = 'X'
      board.board[8] = 'X'
      expect(board.win_cond_col?).not_to eql(false)
    end

    it 'Returns true only if the player symbols are the same. ' do
      board.board[2] = 'X'
      board.board[5] = 'x'
      board.board[8] = 'O'
      expect(board.win_cond_col?).to eql(false)
    end

    it 'Only accepts values matching a column.' do
      board.board[0] = 'O'
      board.board[1] = 'O'
      board.board[2] = 'O'
      expect(board.win_cond_col?).to eql(false)
    end
  end

  describe '#win_cond_diag?' do
    it '#win_cond_diag? checks if a player has won by completing a diagonal' do
      board.board[0] = 'O'
      board.board[4] = 'O'
      board.board[8] = 'O'
      expect(board.win_cond_diag?).not_to eql(false)
    end

    it 'Returns true only if the player symbols are the same. ' do
      board.board[0] = 'X'
      board.board[4] = 'x'
      board.board[8] = 'O'
      expect(board.win_cond_diag?).to eql(false)
    end

    it 'Only accepts values matching a diagonal input.' do
      board.board[0] = 'O'
      board.board[1] = 'O'
      board.board[2] = 'O'
      expect(board.win_cond_diag?).to eql(false)
    end
  end
end

describe Helpers do
  let(:helpers) { Helpers.new }
  describe '#valid_symbol?' do
    it 'Checks if the input is X or O' do
      expect(helpers.valid_symbol?('Z')).not_to eql(true)
    end

    it 'Expect an uppercase input' do
      expect(helpers.valid_symbol?('x')).to eql(false)
    end
  end
end

describe Player do
  let(:player) { Player.new('Shingi', 'X') }
  describe '#initialize?' do
    it 'Checks if the object created is a player' do
      expect(player).to be_a(Player)
    end

    it 'To store attributes of player_name and player_symbol' do
      expect(player).to have_attributes(player_name: a_string_starting_with('S'), player_symbol: 'X')
    end
  end
end

describe String do
  let(:rand_string) { 'jgdjshagdj' }
  describe '#red' do
    it 'Is correctly concatenating the color to the text.' do
      expect(rand_string.red).to eql("\e[31m" + rand_string + "\e[0m")
    end

    it 'Extends the String Class only' do
      expect { 1.red }.to raise_error(NoMethodError)
    end
  end
  describe '#green' do
    it 'Is correctly concatenating the color to the text.' do
      expect(rand_string.green).to eql("\e[32m" + rand_string + "\e[0m")
    end

    it 'Extends the String Class only' do
      expect { 1.green }.to raise_error(NoMethodError)
    end
  end
  describe '#brown' do
    it 'Is correctly concatenating the color to the text.' do
      expect(rand_string.brown).to eql("\e[33m" + rand_string + "\e[0m")
    end

    it 'Extends the String Class only' do
      expect { 1.brown }.to raise_error(NoMethodError)
    end
  end
  describe '#blue' do
    it 'Is correctly concatenating the color to the text.' do
      expect(rand_string.blue).to eql("\e[34m" + rand_string + "\e[0m")
    end

    it 'Extends the String Class only' do
      expect { 1.blue }.to raise_error(NoMethodError)
    end
  end
  describe '#magenta' do
    it 'Is correctly concatenating the color to the text.' do
      expect(rand_string.magenta).to eql("\e[35m" + rand_string + "\e[0m")
    end

    it 'Extends the String Class only' do
      expect { 1.magenta }.to raise_error(NoMethodError)
    end
  end
  describe '#cyan' do
    it 'Is correctly concatenating the color to the text.' do
      expect(rand_string.cyan).to eql("\e[36m" + rand_string + "\e[0m")
    end

    it 'Extends the String Class only' do
      expect { 1.cyan }.to raise_error(NoMethodError)
    end
  end
end
