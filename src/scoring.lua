require 'middleclass'
require 'board'

Scoring = class('Scoring')

local inspect = require('inspect')

function Scoring:initialize(board)
  self.board = board
end

function Scoring:winner()
  self.game_winner = false
  for i,group in pairs(self.board:possible_winning_combinations()) do
    if (group[1] == group[2]) and (group[2] == group[3]) and (group[1] ~= " ") then
      self.game_winner = true
    end
  end
  return self.game_winner
end

function Scoring:winning_mark()
  for i,v in ipairs(self.board:possible_winning_combinations()) do
    if v[1] == v[2] and v[2] == v[3] and v[1] ~= " " then
      self.win_mark = v[1]
      return self.win_mark -- is this returning from the if or the function?
    end
  end
end

function Scoring:draw()
  return self:winner() == false and #self.board:available_spaces() == 0
end
