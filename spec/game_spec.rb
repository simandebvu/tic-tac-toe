require './lib/board.rb'
require './lib/helpers.rb'
require './lib/player.rb'

describe Board do
  let(:board) { Board.new }
  it 'It initializes an array with 9 cells' do
    expect(board.board.size).to eq 9
  end

  it '#update_board should add a symbol to a position' do
    expect(board.update_board(0, 'X')).not_to eql('O')
  end

  it '#move_made? it should check if the move have already been made' do
    board.board[1] = 'X'
    expect(board.move_made?(1)).to eql(true)
  end

  it '#input_valid? checks if input is between 1 - 9 (Integer)' do
    expect(board.input_valid?(5)).to eql(true)
  end

  it '#win_cond_row? checks if a player has won by completing a row' do
    board.board[0] = 'X'
    board.board[1] = 'X'
    board.board[2] = 'X'
    expect(board.win_cond_row?).not_to eql(false)
  end

  it '#win_cond_col? checks if a player has won by completing a column' do
    board.board[2] = 'X'
    board.board[5] = 'X'
    board.board[8] = 'X'
    expect(board.win_cond_col?).not_to eql(false)
  end

  it '#win_cond_diag? checks if a player has won by completing a diagonal' do
    board.board[0] = 'O'
    board.board[4] = 'O'
    board.board[8] = 'O'
    expect(board.win_cond_diag?).not_to eql(false)
  end
end

describe Helpers do
  let(:helpers) { Helpers.new }
  it '#valid_symbol? checks if the input is X or O' do
    expect(helpers.valid_symbol?('Z')).not_to eql(true)
  end
end

describe Player do
  let(:player) { Player.new('Shingi', 'X') }
  it '#initalize checks if the object created is a player' do
    expect(player).to be_a(Player)
  end
end
