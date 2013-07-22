require 'message'
require 'middleclass'

Ui = class('Ui')

function Ui:initialize(output, input)
  self.message = Message:new()
  self.output = stdout
  self.input = stdin
end

function Ui:display_message( ... )
  io.self.output:write(self.Message:retrieve({...}))
end

function Ui:read_input()
return io.self.input:read()
end

function Ui.display_board(board_state)
  local state = board_state
  local nl = "\n"
  local sp = " "
  local pipe = "|"
  local separator = "---+---+---"
  return io.self.output:write(tostring(nl,sp,state[1],sp,pipe,sp,state[2],sp,pipe,sp,state[3],sp,nl,separator,nl,sp,nl,sp,state[4],sp,pipe,sp,state[5],sp,pipe,sp,state[6],sp,nl,separator,nl,sp,nl,sp,state[7],sp,pipe,sp,state[8],sp,pipe,state[9],sp,nl,nl))
end


