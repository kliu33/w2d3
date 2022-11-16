require_relative "board"
require_relative "human_player"

class Game
    def initialize(mark1,mark2)
        @mark1 = mark1
        @mark2 = mark2
        @p1= HumanPlayer.new(mark1)
        @p2 = HumanPlayer.new(mark2)
        @board = Board.new(3)
        @current_player = @p1
    end

    def switch_turn
        @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
    end

    def play
        while !@board.empty_positions? 
            @board.printy
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                print "VICTORY!!"
                return
            end
            self.switch_turn
        end 
        print "draw"
    end 
end