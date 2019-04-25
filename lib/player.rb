class Player
  attr_reader :score, :mark, :inputs

  def initialize(mark)
    @mark = mark
    @score = 0
    @inputs = []
  end

  def turn(game)
    @chosen_tile = get_input(self, game)
    save(@chosen_tile)
    game.board.write(@chosen_tile, @mark)
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
