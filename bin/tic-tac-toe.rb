#!/usr/bin/env ruby
require '../lib/logic.rb'
board = Board.new
userX = Player.new("X")
userO = Player.new("O")


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



play_again = true
while play_again
board = Board.new
board.show
loop do 
    puts "Make your first move Player X"
    tiles = gets.chomp.to_i
    userX.input(tiles)
    board.write(tiles, userX.mark)
    board.show
    if victory?(userX.inputs) 
        userX.score_up
        puts "Victory! yay"
       break
    end
    puts "Make your first move Player O"
    tiles = gets.chomp.to_i
    userO.input(tiles)
    board.write(tiles, userO.mark)
    board.show
    if victory?(userO.inputs)
        userO.score_up
        puts "Victory! yay"
        break
    end


end
puts "do you want toplay again? Please write Y or N"
input = gets.chomp
if input == 'Y'
    play_again = true
    userX.reset
    userO.reset
else
    play_again = false 
    if userX.score > userO.score 
      p "Player X wins!" 
    elsif userX.score < userO.score
        p "Player O wins!"
    elsif userX.score == userO.score
        puts "Tie!" 
    end  
end #if

end #while loop


