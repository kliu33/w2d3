require_relative "board"

b = Board.new(3)
b.place_mark([1, 1], :X)
b.printy
p b.win?(:X)
b.place_mark([0, 0], :X)
b.printy
p b.win?(:X)
b.place_mark([2, 2], :X)
b.printy
p b.win?(:X)
p b.legal_positions