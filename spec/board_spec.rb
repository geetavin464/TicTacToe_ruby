require 'tictac'

describe 'board' do 
  let(:board) {TicTac::Board.new}
  it "has a game_board" do
    expect(board).to respond_to :game_board
  end

  it "has a state" do
    expect(board).to respond_to :state
  end

  it "has a winner" do
    expect(board).to respond_to :winner
  end

  it "print_board" do

  end

  it "submit_move" do

  end

end