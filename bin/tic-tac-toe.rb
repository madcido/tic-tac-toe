#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/ui.rb'
include UI

welcome_msg

userX = Player.new("X")
userO = Player.new("O")

loop do
  board = Board.new
  game = Game.new(userX, userO, board)
  show(game.board)
  game.cycle
  break unless restart?(userX, userO)
end

end_msg(userX,userO)
