#!/usr/bin/env ruby
require '../lib/board.rb'
require '../lib/player.rb'

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

userX = Player.new("X")
userO = Player.new("O")
active_player = rand()*10 < 5 ? userO : userX

play_again = true

while play_again

  board = Board.new

  puts "\n"
  board.show
  puts "\nPlayer #{active_player.mark} will start this match!"

  loop do
    puts "\nPlayer #{active_player.mark}, choose a tile!"
    chosen_tile = gets.chomp.to_i
    active_player.save(chosen_tile)
    board.write(chosen_tile, active_player.mark)
    puts "\n"
    board.show
    if active_player.victory?
      active_player.score_up
      puts "\nPlayer #{active_player.mark} wins, congratulations!"
      break
    end
    active_player = active_player == userX ? userO : userX
  end #of turns loop

  valid_input = false
  until valid_input
    puts "\nPlay again? Y/N"
    input = gets.chomp.upcase
    if input == "Y" || input == "YES"
      valid_input = true
      userX.reset
      userO.reset
      active_player = active_player == userX ? userO : userX
    elsif input == "N" || input == "NO"
      valid_input = true
      play_again = false
    else
      puts "Invalid input. Please type Y or N."
    end
  end #of until valid input

end #of while play again

puts "\n**************************************************"
puts "\nGame over, final score:"
puts "\nPlayer X: #{userX.score}"
puts "Player O: #{userO.score}"
if userX.score > userO.score
  puts "\nPlayer X wins!"
elsif userX.score < userO.score
  puts "\nPlayer O wins!"
else
  puts "\nTie!"
end
puts "\n"
