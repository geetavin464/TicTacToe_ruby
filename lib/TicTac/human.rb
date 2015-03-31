module TicTac
  class Human < Player

    def play_turn(game,board)
      prompt
      move = gets
      board.submit_move(self,move)
    end
  end
end