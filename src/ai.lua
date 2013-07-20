require 'board'
require 'middleclass'
require 'scoring'

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
  local best_max_move = nil
  local best_max_score = nil
  for _,mx_move in pairs(board:available_spaces()) do
    board:set(mx_move, max_mark)
    if Ai:state_is_terminal() then
       max_score = Ai:evaluate_the_board()
    else
      max_move_reference, max_score = Ai:min_move()
    end
    board:undo_move(mx_move)
    if best_max_score == nil or max_score > best_max_score then
      best_max_score = max_score
      best_max_move = mx_move
    end
  end
  return best_max_move, best_max_score
end

function Ai:min_move()
  local best_min_move = nil
  local best_min_score = nil
  for _,mn_move in pairs(board:available_spaces()) do
    board:set(mn_move, min_mark)
      if Ai:state_is_terminal() then
        min_score = Ai:evaluate_the_board()
      else
        min_move_reference, min_score = Ai:max_move()
      end
    board:undo_move(mn_move)
    if best_min_score == nil or min_score < best_min_score then
      best_min_score = min_score
      best_min_move = mn_move
    end
  end
  return best_min_move, best_min_score
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