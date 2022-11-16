require_relative "board"
require_relative "human_player"

class Game
    def initialize(size,*marks)
        @marks = marks
        @players = []
        @marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        @board = Board.new(size)
    end

    def switch_turn
        @players.rotate!
    end

    def play
        while !@board.empty_positions? 
            @board.printy
            @board.place_mark(@players[0].get_position, @players[0].mark)
            if @board.win?(@players[0].mark)
                print "VICTORY!!"
                return
            end
            self.switch_turn
        end 
        print "draw"
    end 
end