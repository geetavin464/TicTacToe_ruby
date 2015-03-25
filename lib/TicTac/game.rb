require 'pry'
module TicTac
  class Game

    attr_accessor :state, :winner

    def initialize
      @state = :started
      @winner = nil
      @board = Board.new
      @p1 = Player.new(name="1", is_human=true, marker = 'X')
      @p2 = Player.new(name="2", is_human=true, marker = 'O')
    end

    def play
      while @state == :started
        player_turn(@p1)
        player_turn(@p2)
      end
      print_result
    end

    def player_turn(player)
      return if @state == :finished
      player.prompt
      move = gets
      @board.submit_move(player,move)
      @board.print_board
      change_state(@board.game_over?, @board.game_won?, player)
    end

    def change_state(game_over, game_won, player)
      if game_over && game_won
        @state = :finished
        @winner = player
      elsif game_over && !game_won
        @state = :finished
      end
    end

    def print_result
      if winner
        puts "Player #{winner.name} wins"
      else
        puts "Its a draw"
      end
      puts "Game Over!"
    end

    def self.present_game_modes
      puts "For Human vs Human select mode 0\nFor Human vs AI select mode 1\nFor AI vs Human select mode3\n"
      puts "Please enter your game mode"
    end

    def self.present_title
      puts "*********"
      puts "TicTacToe"
      puts "*********"
    end

  end
end