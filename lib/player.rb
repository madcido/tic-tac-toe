class Player
  attr_reader :score, :mark, :inputs

  def initialize(mark)
    @mark = mark
    @score = 0
    @inputs = []
  end
  
  def save(input)
    @inputs << input
  end

  def reset_inputs
    @inputs = []
  end

  def score_up
    @score += 1
  end
end
