require 'pry'
module TicTac
  class Player

    attr_accessor :name, :marker, :is_human

    def initialize(name, is_human)
      @name = name
      @is_human = is_human
    end

    def prompt
      puts "Player-#{@name}: Enter move"
    end

  end
end