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

  
end
