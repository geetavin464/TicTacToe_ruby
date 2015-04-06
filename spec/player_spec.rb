require 'tictac'

describe 'player' do
  let(:player) {Player.new("X")}
  it "should respond to name" do
    expect(:player).to respond_to :name
  end

end
