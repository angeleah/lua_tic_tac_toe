require 'middleclass'
require 'player'
require 'ai'
require 'board'

ComputerPlayer = class('ComputerPlayer', Player)

function ComputerPlayer:initialize(mark)
  ComputerPlayer.set_mark(mark)
end

function ComputerPlayer:get_move(board)
  ai = Ai:new(self, board)
  cell_number = ai:find_best_move()
  return cell_number
end