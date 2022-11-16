class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def valid?(pos)
        if (pos[0] > @grid.length - 1 || pos[0] < 0) || (pos[1] > @grid.length - 1 || pos[1] < 0)
            return false 
        else
            return true
        end
    end

    def empty?(pos)
        if self[pos] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(pos, val)
        if valid?(pos) && empty?(pos)
            self[pos] = val 
        else
            raise RuntimeError
        end
    end

end 