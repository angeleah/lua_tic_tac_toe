require 'message'
require 'middleclass'

Ui = class('Ui')
local inspect = require 'inspect'

function Ui:initialize()
  self.message = Message:new()
end

function Ui:display_message(table)
  local current_message = self.message:retrieve(table)
  return io.stdout:write(current_message)
end

function Ui:read_input()
   local input = io.stdin:read()
   return input
end

function Ui.display_board(board_state)
  print("board state is")
  print(inspect(board_state))
  local state = board_state
  print(inspect("state is"))
  print(inspect(state))
  local nl = "\n"
  local sp = " "
  local pipe = "|"
  local separator = "---+---+---"
  -- print("state 1 =")
  -- print(inspect(state[1]))
  -- return io.stdout:write(separator)
   io.stdout:write("\n "..state[1].." | "..state[2].." | "..state[3].." \n".."---+---+---".."\n \n "..state[4].." | "..state[5].." | "..state[6].." \n".."---+---+---".."\n \n "..state[7].." | "..state[8].." | "..state[9].." \n\n")
end


