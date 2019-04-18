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

  end
end

class Player
  attr_reader :score, :inputs

  def initialize (mark)
    @mark = mark
    @score = 0
    @inputs = []
  end

  def input (input)
    @inputs << input
  end
end


module Checks
  V_CONDITIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def valid?
    case self
    when (1..9)
      return true
    else
      return false
    end
  end

  def victory? (player_inputs)
    V_CONDITIONS.each { |x| return true if player_inputs.any?(x[0]) && player_inputs.any?(x[1]) && player_inputs.any?(x[2])}
    false
  end

  def tie?

  end
end
