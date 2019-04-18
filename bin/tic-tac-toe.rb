#!/usr/bin/env ruby
require '../lib/logic.rb'

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

play_again = true

while play_again

  board = Board.new
  puts "\n"
  board.show

  loop do
    puts "\nPlayer X, choose a tile!"
    chosen_tile = gets.chomp.to_i
    userX.save(chosen_tile)
    board.write(chosen_tile, userX.mark)
    puts "\n"
    board.show
    if victory?(userX.inputs)
      userX.score_up
      puts "\nPlayer X wins, congratulations!"
      break
    end

    puts "\nPlayer O, choose a tile!"
    chosen_tile = gets.chomp.to_i
    userO.save(chosen_tile)
    board.write(chosen_tile, userO.mark)
    puts "\n"
    board.show
    if victory?(userO.inputs)
      userO.score_up
      puts "\nPlayer O wins, congratulations!"
      break
    end
  end #of turns loop

  valid_input = false
  until valid_input
    puts "\nPlay again? Y/N"
    input = gets.chomp.upcase
    if input == "Y" || input == "YES"
      valid_input = true
      userX.reset
      userO.reset
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
