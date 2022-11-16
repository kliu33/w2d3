class Board

  attr_reader :size, :grid

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = (n * n)
  end   

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end   

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        p "you sunk my battleship"
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    place = size / 4
    while num_ships != place
        x = rand(0...self.grid.length)
        y = rand(0...self.grid.length)
        if self[[x,y]] == :N
            self[[x,y]] = :S
        end
    end
  end

  def hidden_ships_grid
    out = Array.new(@grid.length) {Array.new(@grid.length)}
    @grid.each_with_index do |subarr, idx|
        subarr.each_with_index do |ele, idx2|
            if ele == :S 
                out[idx][idx2] = :N 
            else
                out[idx][idx2] = ele
            end
        end
    end
    out
  end   

  def self.print_grid(matrix)
    matrix.each do |sub_arr|
        sub_arr.each do |ele|
            print "#{ele} "
        end
        print "\n"
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
