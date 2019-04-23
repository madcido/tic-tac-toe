def welcome_msg
  puts "\n"
  puts "**************************************************"
  puts "*                                                *"
  puts "*       Let's Play                               *"
  puts "*   _______    _______      _______              *"
  puts "*  |__   __|  |__   __|    |__   __|        __   *"
  puts "*     | |    _   | |  _   _   | |  _   _   | /   *"
  puts "*     | | o |    | |  _| |    | | | | |_|  |/    *"
  puts "*     |_| | |_   |_| |_| |_   |_| |_| |_   o     *"
  puts "*                                                *"
  puts "**************************************************"
  puts "\n"
  puts "Welcome! On each turn, the player must choose a number"
  puts "corresponding to the board tile he wants to mark."
  puts "The first player to place three marks in a straight line"
  puts "wins the match. You can play as many matches as you want."
  puts "The final score will be shown at the end of the game."
end

def show(board)
  puts "\n"
  puts " #{board.tiles[0]} | #{board.tiles[1]} | #{board.tiles[2]} "
  puts "---+---+---"
  puts " #{board.tiles[3]} | #{board.tiles[4]} | #{board.tiles[5]} "
  puts "---+---+---"
  puts " #{board.tiles[6]} | #{board.tiles[7]} | #{board.tiles[8]} "
end

def end_msg(p1, p2)
  puts "\n**************************************************"
  puts "\nGame over, final score:"
  puts "\nPlayer #{p1.mark}: #{p1.score}"
  puts "Player #{p2.mark}: #{p2.score}"
  if p1.score > p2.score
    puts "\nPlayer #{p1.mark} wins!"
  elsif p1.score < p2.score
    puts "\nPlayer #{p2.mark} wins!"
  else
    puts "\nTie!"
  end
  puts "\n"
end
