require_relative "board"
require_relative "human_player"

class Game
    def initialize(mark1,mark2)
        @mark1 = HumanPlayer.new(mark1)
        @mark2 = HumanPlayer.new(mark2)
        @board = Board.new(3)
        @current_player = :p1
    end

    def switch_turn
        @current_player == :p1 ? @current_player = :p2 : @current_player = :p1
    end
end