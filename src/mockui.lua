require 'board'
require 'busted'
require 'message'
require 'middleclass'

Mockui = class('Mockui')

function Mockui:read_input()
  return self.input
end

function Mockui:display_board(board_state)
  local state = board_state
  self.output =  "\n "..state[1].." | "..state[2].." | "..state[3].." \n---+---+---\n "..state[4].." | "..state[5].." | "..state[6].." \n---+---+---\n "..state[7].." | "..state[8].." | "..state[9].." \n\n"
  return self.output
end