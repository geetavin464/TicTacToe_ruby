require 'pry'
module TicTac
  class Game
    attr_accessor :mode, :board, :player, :opponent

    def initialize
      present_title
      present_game_modes
      @board = Board.new
      add_players
    end

    def play
      board.print_board
      until board.state == :finished
        @player.play_turn(self, @board)
        @opponent.play_turn(self, @board) unless @board.state == :finished
      end
      print_result
    end

private

    def present_title
      puts "*********"
      puts "TicTacToe"
      puts "*********"
    end

    def present_game_modes
      puts "For Human vs Human select mode 0\nFor Human vs AI select mode 1\nFor AI vs Human select mode 2\n"
      puts "Please enter your game mode"
      begin
        @mode = gets.chomp
        raise "Invalid Mode" unless [0,1,2].include?(@mode.to_i)
      rescue
        puts "Invalid Mode. Enter again."
        present_game_modes        
      end
    end

    def add_players
      case mode.to_i
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

    def print_result
      if @board.winner
        puts "Player #{@board.winner.name} wins"
      else
        puts "Its a draw"
      end
      puts "Game Over!"
    end

  end
end