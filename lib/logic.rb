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

class Player
  attr_reader :score, :inputs, :mark

  def initialize (mark)
    @mark = mark
    @score = 0
    @inputs = []
  end

  def save (input)
    @inputs << input
  end

  def valid? (input)
    if 1 <= input && input <= 9
      @inputs.each { |x| return false if input == x }
    else
      return false
    end
    true
  end

  def reset
    @inputs = []
  end

  def score_up
    @score += 1
  end
end

def victory? (player_inputs)
  v_conditions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  v_conditions.each { |x| return true if player_inputs.any?(x[0]) && player_inputs.any?(x[1]) && player_inputs.any?(x[2]) }
  false
end
