#!/usr/bin/env ruby
require '../lib/board.rb'
require '../lib/player.rb'
require '../lib/game.rb'
require '../lib/ui.rb'

welcome_msg

userX = Player.new("X")
userO = Player.new("O")
board = Board.new
game = Game.new(userX, userO, board)

loop do
  show(board)
  game.cycle
  break unless game.restart?
end

end_msg(userX,userO)
