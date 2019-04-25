#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/ui.rb'
include UI

welcome_msg

userX = Player.new("X")
userO = Player.new("O")
board = Board.new

loop do
  game = Game.new(userX, userO, board)
  show(board)
  game.cycle
  break unless restart?
  board = Board.new
  userX.reset_inputs
  userO.reset_inputs
end

end_msg(userX,userO)
