class Board

    attr_reader :grid

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
            self[pos] = val.to_s
        else
            raise RuntimeError
        end
    end

    def printy
        @grid.each_with_index do |subarr, idx|
            subarr.each_with_index do |ele, idx2|
                print "#{ele} "
            end
            print "\n"
        end
    end

    def win?(mark)
        (0...@grid.length).each do |y|
            same = 0
            (0...@grid.length).each do |x|
                if mark == @grid[x][y]
                    same += 1
                end
            end
            return true if same == @grid.length
        end
        (0...@grid.length).each do |y|
            same = 0
            (0...@grid.length).each do |x|
                if mark == @grid[y][x]
                    same += 1
                end
            end
            return true if same == @grid.length
        end
        same = 0
        (0...@grid.length).each do |num|
            if @grid[num][num] == mark
                same += 1
            end
            return true if same == @grid.length
        end
        same = 0
        (0...@grid.length).each do |num|
            if @grid[@grid.length - 1 - num][num] == mark
                same += 1
            end
            return true if same == @grid.length
        end
        false
    end

    def empty_positions?
        @grid.flatten.count("_") > 0
    end

end 