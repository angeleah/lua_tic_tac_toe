require 'middleclass'
require 'board'

Scoring = class('Scoring')

local inspect = require('inspect')

function Scoring:winner(board)
  self.game_winner = false
  for i,group in pairs(board:possible_winning_combinations()) do
    if (group[1] == group[2]) and (group[2] == group[3]) and (group[1] ~= " ") then
      self.game_winner = true
    end
  end
  return self.game_winner
end

function Scoring:winning_mark(board)
  for i,v in ipairs(board:possible_winning_combinations()) do
    if v[1] == v[2] and v[2] == v[3] and v[1] ~= " " then
      self.win_mark = v[1]
      return self.win_mark -- is this returning from the if or the function?
    end
  end
end

function Scoring:draw(board)
  return self:winner(board) == false and #board:available_spaces(board) == 0
end