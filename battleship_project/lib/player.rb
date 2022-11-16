class Player
    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        move = gets.chomp
        move.split(" ").map {|val| val.to_i}
      end
end
