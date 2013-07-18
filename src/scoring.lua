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

function group_equal(group)
  if group[1] == group[2] and group[2] == group[3] and group[1] ~= " " then
    winner = true
    return true
  else
    return false
  end
end
