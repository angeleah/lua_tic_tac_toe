require 'message'
require 'middleclass'

local inspect = require 'inspect'

Ui = class('Ui')

function Ui:initialize(output, input)
  self.message = Message.new()
  self.output = output or io.stdin
  print(self.output)
  self.input = input or io.stdin
end

