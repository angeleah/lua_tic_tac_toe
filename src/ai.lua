require 'board'
require 'middleclass'
require 'scoring'

Ai = class('Ai')

function Ai:initialize(a_player, a_board)
  board = a_board
  scoring = Scoring:new(board)
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

function Ai:select_optimal_start_move()
  moves = {0,2,4,6,8}
  i = math.random(#moves)
  return moves[i]
end

function Ai:state_is_terminal()
  return scoring:winner() or scoring.draw()
end

function Ai:evaluate_the_board()
  if scoring:winner() and scoring.winning_mark() ~= max_mark then
    return -1
  elseif scoring:winner() and scoring.winning_mark() == max_mark then
    return 1
  elseif scoring.draw() then
      return 0
  end
end