class Player
  attr_reader :score, :mark
  attr_accessor :inputs

  def initialize(mark)
    @mark = mark
    @score = 0
    @inputs = []
  end

  def score_up
    @score += 1
  end
end
