require 'board'
require 'middleclass'
require 'scoring'

local inspect = require 'inspect'

Ai = class('Ai')

function Ai:initialize(a_player, a_board)
  board = a_board
  scoring = Scoring:new(board)
  player = a_player
  max_mark = player.mark()
  min_mark = ''
end

function Ai:find_opponent_mark()
  local marks = board:current_state()
  for _,v in pairs(marks) do
    if v ~= " " and v ~= max_mark then
      min_mark = v
      return min_mark
    end
  end
end

function Ai:select_optimal_start_move()
  moves = {0,2,4,6,8}
  i = math.random(#moves)
  return moves[i]
end

function Ai:find_best_move()
  if (#board:available_spaces()) == 9 then
    best_move = Ai:select_optimal_start_move()
  else
    Ai:find_opponent_mark()
    move_reference, best_score = Ai:max_move()
    best_move = move_reference
  end
  return best_move
end

function Ai:max_move()
  best_move = nil
  best_score = nil
  for _,move in pairs(board:available_spaces()) do
    board:set(move, max_mark)
     -- print(inspect(board:available_spaces()))
     -- print(inspect(Ai:state_is_terminal()))
    if Ai:state_is_terminal() then
      score = Ai:evaluate_the_board()
    else
      move_reference, score = Ai:min_move()
    end
    board:undo_move(move)
    if best_score == nil or score > best_score then
      best_score = score
      best_move = move
    end
  end
  return best_move, best_score
end

function Ai:min_move()
  best_move = nil
  best_score = nil
    -- print(inspect(board:available_spaces()))
     -- print(inspect(Ai:state_is_terminal()))
  for _,move in pairs(board:available_spaces()) do
    -- print(max_mark)
    board:set(move, min_mark)
    -- print(inspect(board:available_spaces()))
    print(Ai:state_is_terminal())
      if Ai:state_is_terminal() then
        score = Ai:evaluate_the_board()
      else
        move_reference, score = Ai:max_move()
      end
    board:undo_move(move)
    if best_score == nil or score < best_score then
      best_score = score
      best_move = move
    end
  end
  return best_move, best_score
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