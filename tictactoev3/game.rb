require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(size, hash)
        @players = []
        hash.each do |k, v|
            if v == false
                @players << HumanPlayer.new(k) 
            else
                @players << ComputerPlayer.new(k) 
            end 
        end
        @board = Board.new(size)
    end

    def switch_turn
        @players.rotate!
    end

    def play
        while @board.empty_positions? 
            @board.printy
            @board.place_mark(@players[0].get_position(@board.legal_positions), @players[0].mark)
            if @board.win?(@players[0].mark)
                print "VICTORY!!"
                return
            end
            self.switch_turn
        end 
        print "draw"
    end 
end