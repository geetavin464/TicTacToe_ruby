require 'tictac'

describe "game" do 
  let(:game) {TicTac::Game.new}

  it "has a mode" do 
    expect(game).to respond_to :mode
  end

  it "has board attribute" do
    expect(game).to respond_to :board
  end

  it "the board attribute is an instance of the Board class" do
    expect(game.board).to be_an_instance_of TicTac::Board
  end

  it "mode is either 0, 1 or 2" do
    expect(game.mode.to_i).to be < 3
    expect(game.mode.to_i).to be >=0
  end
  
end