class Game
  @@v_conditions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize(p1, p2, board)
    @p1 = p1
    @p2 = p2
    @board = board
    @active_player = rand()*10 < 5 ? @p2 : @p1
  end

  def cycle
    loop do
      change_active_player
      get_input
      save_input
      show(@board)
      break if victory?
      break if tie?
    end
  end

  def restart?
    loop do
      puts "\nPlay again? Y/N"
      input = gets.chomp.upcase
      if input == "Y" || input == "YES"
        reset
        return true
      elsif input == "N" || input == "NO"
        return false
      else
        puts "Invalid input. Please type Y or N."
      end
    end
  end

  private

  def get_input
    loop do
      puts "\nPlayer #{@active_player.mark}, choose a tile!"
      @chosen_tile = gets.chomp.to_i
      if valid?(@chosen_tile)
        break
      else
        puts "Invalid input. Please choose a valid tile."
      end
    end
  end

  def save_input
    @active_player.inputs << @chosen_tile
    @board.tiles[@chosen_tile-1] = @active_player.mark
  end

  def victory?
    @@v_conditions.each do |x|
      if @active_player.inputs.any?(x[0]) && @active_player.inputs.any?(x[1]) && @active_player.inputs.any?(x[2])
        @active_player.score_up
        puts "\nPlayer #{@active_player.mark} wins, congratulations!"
        return true
      end
    end
    false
  end

  def tie?
    if @board.full?
      puts "\nNo more available tiles in the board. It's a tie!"
      return true
    end
    false
  end

  def change_active_player
    @active_player = @active_player == @p1 ? @p2 : @p1
  end

  def valid?(input)
    if 1 <= input && input <= 9
      @p1.inputs.each { |x| return false if input == x }
      @p2.inputs.each { |x| return false if input == x }
    else
      return false
    end
    true
  end

  def reset
    @p1.inputs = []
    @p2.inputs = []
    @board.tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
