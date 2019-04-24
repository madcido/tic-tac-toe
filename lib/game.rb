class Game
  @@v_conditions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  attr_reader :board

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @board = Board.new
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

  def restart?
    loop do
      puts "\nPlay again? Y/N"
      input = gets.chomp.upcase
      if input == "Y" || input == "YES"
        @p1.reset_inputs
        @p2.reset_inputs
        @board = Board.new
        return true
      elsif input == "N" || input == "NO"
        return false
      else
        puts "Invalid input. Please type Y or N."
      end
    end
  end

  # def get_input
  #   loop do
  #     puts "\nPlayer #{@active_player.mark}, choose a tile!"
  #     @chosen_tile = gets.chomp.to_i
  #     if valid?(@chosen_tile)
  #       break
  #     else
  #       puts "Invalid input. Please choose a valid tile."
  #     end
  #   end
  # end

  # def save_input
  #   @active_player.inputs << @chosen_tile
  #   @board.tiles[@chosen_tile-1] = @active_player.mark
  # end

  def victory?(player)
    @@v_conditions.each { |x| return true if player.inputs.any?(x[0]) && player.inputs.any?(x[1]) && player.inputs.any?(x[2]) }
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

  # def reset
  #   @p1.inputs = []
  #   @p2.inputs = []
  #   @board.tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  # end
end
