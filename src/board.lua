require 'middleclass'

Board = class('Board')

function Board:initialize()
  self.cells = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
end

function Board:set(cell, mark)
  self.cells[cell] = mark
end

function Board:get(cell)
  return self.cells[cell]
end

function Board:current_state()
  return self.cells
end

function Board:undo_move(cell)
  self.cells[cell] = " "
end

function Board:clear_all_spaces()
  self.cells = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
end

function Board:available_spaces()
  local spaces = {}
  for index,val in ipairs(self.cells) do
    if val == " " then
      table.insert(spaces, index)
    end
  end
  return spaces
end

function Board:cell_occupied(cell)
  return self.cells[cell] ~= " "
end

function Board:rows()
  return { {self.cells[1],self.cells[2],self.cells[3]}, {self.cells[4],self.cells[5],self.cells[6]}, {self.cells[7],self.cells[8],self.cells[9]} }
end

function Board:columns()
  return { {self.cells[1],self.cells[4],self.cells[7]}, {self.cells[2],self.cells[5],self.cells[8]}, {self.cells[3],self.cells[6],self.cells[9]} }
end

function Board:diagonal_forward()
  return {self.cells[3],self.cells[5],self.cells[7]}
end

function Board:diagonal_back()
  return {self.cells[1],self.cells[5],self.cells[9]}
end

function Board:add_region(func, tbl)
  for k,v in pairs(func) do
    table.insert(tbl, v)
  end
end

function Board:possible_winning_combinations()
  local pwc = {}
  self:add_region(self:rows(), pwc)
  self:add_region(self:columns(), pwc)
  table.insert(pwc, self:diagonal_forward())
  table.insert(pwc, self:diagonal_back())
  return pwc
end