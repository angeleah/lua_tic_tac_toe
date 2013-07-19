require 'middleclass'
require 'board'

Scoring = class('Scoring')

function Scoring:winner(board)
  winner = false
  for i,v in ipairs(board:possible_winning_combinations()) do
    group_equal(v)
  end
  return winner
end

function Scoring:winning_mark(board)
  for i,v in ipairs(board:possible_winning_combinations()) do
    if v[1] == v[2] and v[2] == v[3] and v[1] ~= " " then
      win_mark = v[1]
      return win_mark
    end
  end
end

function group_equal(group)
  if group[1] == group[2] and group[2] == group[3] and group[1] ~= " " then
    winner = true
    return true
  else
    return false
  end
end

function Scoring:draw(board)
  return Scoring:winner(board) == false and #board:available_spaces() == 0
end