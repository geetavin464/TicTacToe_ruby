require 'pry'

module TicTac
  WINNING_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  class Board
    attr_accessor :game_board

    def initialize
      @game_board = "---------"
    end

    def submit_move(player, move)
      move.chomp!
      if move =~ /[ABCabc][123]/ and @game_board[getMap(move)] == '-'
        @game_board[getMap(move)] = player.marker
        puts "Player #{player.name} submitted move #{move}"
      else
        puts "Invalid Move. Player #{player.name} Enter move again"
        move = gets
        submit_move(player,move)
      end
    end

    def game_over?
      !@game_board.include?('-')
    end

    def game_won?
      WINNING_COMBINATIONS.each do |alignment|
        return true if all_equal?(@game_board[alignment[0]], @game_board[alignment[1]], @game_board[alignment[2]])
      end
      return false
    end

    def print_board
      puts "   1  2  3"
      puts " A #{@game_board[0]}  #{@game_board[1]}  #{@game_board[2]}"
      puts " B #{@game_board[3]}  #{@game_board[4]}  #{@game_board[5]}"
      puts " C #{@game_board[6]}  #{@game_board[7]}  #{@game_board[8]}"
    end

  private
    def getMap(move)
      case move.upcase
        when "A1" then return 0
        when "A2" then return 1
        when "A3" then return 2
        when "B1" then return 3
        when "B2" then return 4
        when "B3" then return 5
        when "C1" then return 6
        when "C2" then return 7
        when "C3" then return 8
      end
    end

    def all_equal?(*elements)
      elements.all?{|x| x == elements.first && x != '-' }
    end

  end
end