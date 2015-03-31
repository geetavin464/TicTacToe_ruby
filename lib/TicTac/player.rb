require 'pry'
module TicTac
  class Player

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def prompt
      puts "Player-#{@name}: Enter move"
    end
    
  end
end