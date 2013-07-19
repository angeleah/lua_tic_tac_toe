require 'middleclass'
require 'player'
require 'board'

HumanPlayer = class('HumanPlayer', Player)

function HumanPlayer:initialize(mark)
  HumanPlayer.set_mark(mark)
end

function HumanPlayer:get_move(board)
  return false
end