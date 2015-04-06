module TicTac
  class AI < Player

    def play_turn(game, board)
      board.submit_move(self, perfect_move(game,board).to_s)
    end
  
  private
    
    def perfect_move(game,board)
      board.possible_moves[max_score_move(game,board).to_i]
    end

    def possible_scores(game,board)
      scores = []
      board.possible_moves.each do |m|
        scores << board.score(m, self, opponent(game))
      end
      scores
    end

    def max_score_move(game,board)
      max_index=0
      possible_scores(game,board).each_index do |e,i|
        max_index = i if e.to_i>max_index.to_i
      end
      max_index
    end

    def opponent(game)
      if game.player == self
        game.opponent
      else
        game.player
      end

    end

  end 
end