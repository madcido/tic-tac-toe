class Board
  def initialize
    @tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts " #{@tiles[0]} | #{@tiles[1]} | #{@tiles[2]} "
    puts "---+---+---"
    puts " #{@tiles[3]} | #{@tiles[4]} | #{@tiles[5]} "
    puts "---+---+---"
    puts " #{@tiles[6]} | #{@tiles[7]} | #{@tiles[8]} "
  end

  def write (tile, mark)
    @tiles[tile-1] = mark
  end

  def full?
    return false if @tiles.any?(1..9)
    true
  end
end
