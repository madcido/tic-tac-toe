#!/usr/bin/env ruby
require '../lib/board.rb'
require '../lib/player.rb'
require '../lib/game.rb'
require '../lib/ui.rb'
include UI

welcome_msg

userX = Player.new("X")
userO = Player.new("O")
game = Game.new(userX, userO)

loop do
  show(game.board)
  game.cycle
  break unless game.restart?
end

end_msg(userX,userO)
