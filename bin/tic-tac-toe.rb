#!/usr/bin/env ruby
require '../lib/logic.rb'
include Checks
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



while userX
    puts "Make your first move Player X"
    tiles = gets.chomp.to_i
    userX.input(tiles)
    board.write(tiles, userX.mark)
    board.show
    p userX.inputs
    break if victory?(userX.inputs)
    puts "Make your first move Player O"
    tiles = gets.chomp.to_i
    userO.input(tiles)
    board.write(tiles, userO.mark)
    board.show
    break if victory?(userO.inputs)     

end








