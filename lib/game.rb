class Game
  attr_reader :board

  def initialize(p1, p2, board)
    @p1 = p1
    @p2 = p2
    @board = board
    @active_player = rand()*10 < 5 ? @p2 : @p1
  end

  def cycle
    loop do
      change_active_player
      @active_player.turn(self)
      show(@board)
      if victory?(@active_player)
        @active_player.score_up
        win_msg(@active_player)
        break
      end
      if tie?
        tie_msg
        break
      end
    end
  end

  def victory?(player)
    @victory_conditions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    @victory_conditions.each { |x| return true if player.inputs.any?(x[0]) && player.inputs.any?(x[1]) && player.inputs.any?(x[2]) }
    false
  end

  def tie?
    return true if board.full?
    false
  end

  def change_active_player
    @active_player = @active_player == @p1 ? @p2 : @p1
  end

  def valid?(input)
    if 1 <= input && input <= 9 # input between 1 and 9?
      @p1.inputs.each { |x| return false if input == x } # input already taken by p1?
      @p2.inputs.each { |x| return false if input == x } # input already taken by p2?
    else # input different from (1..9)?
      return false
    end
    true
  end
end
