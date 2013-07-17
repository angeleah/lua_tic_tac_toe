require 'middleclass'

Board = class("Person")

function Board:initialize()
  cells = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
end

function Board:get(cell)
  return cells[cell]
end
