#!/usr/bin/env ruby
require '../lib/board.rb'
require '../lib/player.rb'

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

userX = Player.new("X")
userO = Player.new("O")
active_player = rand()*10 < 5 ? userO : userX #this randomly chooses the starting player

play_again = true
while play_again

  board = Board.new

  puts "\n"
  board.show
  puts "\nPlayer #{active_player.mark} will start this match!"

  loop do #start of turn

    valid_input = false
    until valid_input
      puts "\nPlayer #{active_player.mark}, choose a tile!"
      chosen_tile = gets.chomp.to_i
      if userX.valid?(chosen_tile) && userO.valid?(chosen_tile) #check for valid tile, i.e it exists and has not yet been taken
        valid_input = true
        active_player.save(chosen_tile)
        board.write(chosen_tile, active_player.mark)
        puts "\n"
        board.show
      else
        puts "\nInvalid input. Please choose a valid tile."
      end
    end #of input validation for player turn

    if active_player.victory? #check for victory
      active_player.score_up
      puts "\nPlayer #{active_player.mark} wins, congratulations!"
      break
    end

    if board.full? #check for tie
      puts "\nNo more available tiles in the board. It's a tie!"
      break
    end

    active_player = active_player == userX ? userO : userX #swap the active player, changing turns

  end #end of turn

  valid_input = false
  until valid_input
    puts "\nPlay again? Y/N"
    input = gets.chomp.upcase
    if input == "Y" || input == "YES" #if play again, reset the players' inputs and change the active player
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
  end #of input validation for play again

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
