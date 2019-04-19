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

  def victory?
    v_conditions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    v_conditions.each { |x| return true if @inputs.any?(x[0]) && @inputs.any?(x[1]) && @inputs.any?(x[2]) }
    false
  end

  def reset
    @inputs = []
  end

  def score_up
    @score += 1
  end
end
