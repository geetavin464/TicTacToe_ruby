module TicTac
  class AI < Player


  # def possible_moves(board)
  #   possible_moves = []
  #   for i in 0..board.game_board.size
  #     possible_moves << i if board.game_board[i] == "-"
  #   end
  #   possible_moves
  # end

  # def score(move, board, player)
  #     if board.game_won?(move, player)
  #       return 10
  #     elsif board.game_won?(move, player)
  #       return -10
  #     else
  #       return 0
  #     end
  # end

  # def get_move
  #       move_scores = Hash.new
  #       move_scores[move] = score(move,board,player)
  #       possible_moves(board).each do |move|
  #         if move.end_game?
  #           move_scores[move] = score(move)
  #         else

  #         end
  #       end
  #       move_scores.each_pair do |k,v|
  #         max = 0
  #         if v>max
  #           max = v
  #           move = k
  #         end
  #         return k
  #       end

  #     end
    end
end