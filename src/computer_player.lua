require 'ai'
require 'board'
require 'middleclass'

ComputerPlayer = class('ComputerPlayer')

function ComputerPlayer:set_mark(mark)
  player_mark = mark
end

function ComputerPlayer:mark()
  return player_mark
end

function ComputerPlayer:get_move(board)
  ai = Ai:new(self, board)
  cell_number = ai:find_best_move()
  return cell_number
end