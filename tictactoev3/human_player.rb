class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal)
        p "Player #{@mark}: enter a position with coordinates separated with a space like '1 2'"
        move = gets.chomp.split(" ").map {|val| val.to_i}
        while move.length != 2 || !legal.include?(move)
            puts "Illegal move"
            p "Player #{@mark}: enter a position with coordinates separated with a space like '1 2'"
            move = gets.chomp.split(" ").map {|val| val.to_i}
        end
        move
    end


end