require 'board'
require 'middleclass'

HumanPlayer = class('HumanPlayer')

function HumanPlayer:set_mark(mark)
    self.mark = mark
end

function HumanPlayer:get_move(board)
  return false
end