class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Player #{@mark}: enter a position with coordinates separated with a space like '1 2'"
        move = gets.chomp
        if move.split(" ").length != 2 
            puts "Please use two numbers"
            raise RuntimeError
        end
        move.split(" ").map {|val| val.to_i}
    end


end