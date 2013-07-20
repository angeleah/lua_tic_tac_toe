require 'board'
require 'middleclass'
require 'scoring'

Ai = class('Ai')

function Ai:initialize(a_player, a_board)
  board = a_board
  scoring = Scoring:new()
  player = a_player
  max_mark = player.mark()
end

function Ai:find_best_move(cell, mark)
  return 8
end

function Ai:find_opponent_mark()
  local marks = board:current_state()
  for _,v in pairs(marks) do
    if v ~= " " and v ~= max_mark then
      return v
    end
  end
end