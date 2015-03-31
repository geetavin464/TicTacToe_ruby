require 'pry'
require 'forwardable'
module TicTac
  class Game
    extend Forwardable
    attr_accessor :mode

    def initialize
      @mode = 0
      @board = Board.new
      add_players
    end

    def add_players
      case mode
      when 0
        @player = Human.new(name="X")
        @opponent = Human.new(name="O")
      when 1
        @player = Human.new(name="X")
        @opponent = AI.new(name="O")
      when 2
        @player = AI.new(name="X")
        @opponent = Human.new(name="O")
      end
    end

    def play
      @board.print_board
      until @board.state == :finished
        @player.play_turn(self, @board)
        @opponent.play_turn(self, @board) unless @board.state == :finished
      end
      print_result
    end

    def print_result
      if @board.winner
        puts "Player #{@board.winner.name} wins"
      else
        puts "Its a draw"
      end
      puts "Game Over!"
    end

    def self.present_game_modes
      puts "For Human vs Human select mode 0\nFor Human vs AI select mode 1\nFor AI vs Human select mode 2\n"
      puts "Please enter your game mode"
      @mode = gets
    end

    def self.present_title
      puts "*********"
      puts "TicTacToe"
      puts "*********"
    end

  end
end