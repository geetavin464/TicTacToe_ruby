require 'pry'

module TicTac
  WINNING_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  class Board
    attr_accessor :game_board, :state, :winner

    def initialize
      @game_board = "---------"
      @state = :started
      @winner = nil
    end

    def print_board
      puts "   1  2  3"
      puts " A #{game_board[0]}  #{game_board[1]}  #{game_board[2]}"
      puts " B #{game_board[3]}  #{game_board[4]}  #{game_board[5]}"
      puts " C #{game_board[6]}  #{game_board[7]}  #{game_board[8]}"
    end

    def submit_move(player, move)
      move.chomp!
      if valid_move(move)
        accept_move(player,move)
      else
        request_valid_move(player,move)
      end
      print_board
      change_state(player)
    end

    def possible_moves
      available_moves = []
      game_board.each_char.with_index do |e,i|
        available_moves << i if e == "-"
      end
      available_moves
    end

    def score(move, ai, human_opponent)
      temp_board = game_board
      temp_board[getMap(move)] = ai.name
      if game_won(temp_board, ai)
        score = +10
      elsif game_won(temp_board, human_opponent)
        score = -10
      else
        score = 0
      end
    end

  private
    def getMap(move)
      case move.to_s.upcase
        when "A1" then return 0
        when "A2" then return 1
        when "A3" then return 2
        when "B1" then return 3
        when "B2" then return 4
        when "B3" then return 5
        when "C1" then return 6
        when "C2" then return 7
        when "C3" then return 8
        else move
      end
    end

    def all_equal?(*elements)
      elements.all?{|x| x == elements.first && x != '-' }
    end

    def valid_move(move)
      move =~ /[ABCabc][123]/ and game_board[getMap(move)] == '-'
    end

    def request_valid_move(player,move)
      puts "Invalid Move. Player #{player.name} Enter move again"
      move = gets
      submit_move(player,move)
    end

    def accept_move(player,move)
      game_board[getMap(move)] = player.name
      puts "Player #{player.name} submitted move #{move}"
    end

    def change_state(player)
      @state = :finished  if (game_over(game_board) || game_won(game_board, player))
      @winner = player if game_won(game_board, player)
    end

    def game_over(this_board)
      !this_board.include?('-')
    end

    def game_won(this_board, player)
      WINNING_COMBINATIONS.each do |alignment|
        return true if all_equal?(this_board[alignment[0]], this_board[alignment[1]], this_board[alignment[2]], player.name)
      end
      return false
    end

  end
end