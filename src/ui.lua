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

function Ui:display_board(state)
  print("board to be printed is")
  print(inspect(state))
  self.nl = "\n"
  self.sp = " "
  self.pipe = "|"
  self.separator = "---+---+---"
  io.stdout:write("\n "..state[1].." | "..state[2].." | "..state[3].." \n".."---+---+---".."\n \n "..state[4].." | "..state[5].." | "..state[6].." \n".."---+---+---".."\n \n "..state[7].." | "..state[8].." | "..state[9].." \n\n")
end


