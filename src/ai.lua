require 'board'
require 'middleclass'
require 'scoring'

Ai = class('Ai')

local  inspect = require 'inspect'

function Ai:initialize(player, board)
  self.board = board
  self.scoring = Scoring:new()
  self.player = player
  self.max_mark = self.player.mark
end

function Ai:find_opponent_mark()
  for _,v in pairs(self.board:current_state()) do
    if v ~= " " and v ~= self.max_mark then
      return v
    end
  end
end

function Ai:select_optimal_start_move()
  local moves = {0,2,4,6,8}
  local i = math.random(#moves)
  return moves[i]
end

function Ai:find_best_move()
  if (#self.board:available_spaces()) == 9 then
    self.best_move = self:select_optimal_start_move()
  else
    self.min_mark = self:find_opponent_mark()
    self.move_reference, self.best_score = self:max_move()
    self.best_move = self.move_reference
  end
  return self.best_move
end

function Ai:max_move()
  local best_max_move = nil
  local best_max_score = nil
  for _,mx_move in pairs(self.board:available_spaces()) do
    self.board:set(mx_move, self.max_mark)
    if self:state_is_terminal() then
       self.max_score = self:evaluate_the_board()
    else
      self.max_move_reference, self.max_score = self:min_move()
    end
    self.board:undo_move(mx_move)
    if best_max_score == nil or self.max_score > best_max_score then
      best_max_score = self.max_score
      best_max_move = mx_move
    end
  end
  return best_max_move, best_max_score
end

function Ai:min_move()
  local best_min_move = nil
  local best_min_score = nil
  for _,mn_move in pairs(self.board:available_spaces()) do
    self.board:set(mn_move, self.min_mark)
      if self:state_is_terminal() then
        self.min_score = self:evaluate_the_board()
      else
        self.min_move_reference, self.min_score = self:max_move()
      end
    self.board:undo_move(mn_move)
    if best_min_score == nil or self.min_score < best_min_score then
      best_min_score = self.min_score
      best_min_move = mn_move
    end
  end
  return best_min_move, best_min_score
end

function Ai:state_is_terminal()
  return self.scoring:winner(board) or self.scoring:draw(board)
end

function Ai:evaluate_the_board()
  if self.scoring:winner(board) and self.scoring:winning_mark(board) ~= self.max_mark then
    return -1
  elseif self.scoring:winner(board) and self.scoring:winning_mark(board) == self.max_mark then
    return 1
  elseif self.scoring:draw(board) then
    return 0
  end
end