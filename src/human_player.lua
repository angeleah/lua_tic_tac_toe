require 'board'
require 'middleclass'

HumanPlayer = class('HumanPlayer')

function HumanPlayer:set_mark(mark)
  player_mark = mark
end

function HumanPlayer:mark()
  return player_mark
end

function HumanPlayer:get_move(board)
  return false
end