require 'middleclass'
require 'board'

Ai = class('Ai')

function Ai:initialize(player, a_board)
  board = a_board
end

function Ai:find_best_move(cell, mark)
  return 8
end