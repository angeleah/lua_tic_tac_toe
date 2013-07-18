require 'middleclass'

Board = class("Person")

function Board:initialize()
  cells = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
end

function Board:set(cell, mark)
  cells[cell] = mark
end

function Board:get(cell)
  return cells[cell]
end

function Board:current_state()
  return cells
end

function Board:undo_move(cell)
  cells[cell] = " "
end