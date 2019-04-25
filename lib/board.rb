class Board
  attr_reader :tiles

  def initialize
    @tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def write(tile, mark)
    @tiles[tile-1] = mark
  end

  def full?
    return false if @tiles.any?(1..9)
    true
  end
end
