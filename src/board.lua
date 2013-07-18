require 'middleclass'

Board = class('Person')

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

function Board:clear_all_spaces()
  for i = 1, 9 do
    Board:undo_move(i)
  end
end

function Board:available_spaces()
  spaces = {}
  for index,val in ipairs(cells) do
    if val == " " then
      table.insert(spaces, index)
    end
  end
  return spaces
end

function Board:cell_occupied(cell)
  return Board:get(cell) ~= " "
end

function Board:rows()
  return { {cells[1],cells[2],cells[3]}, {cells[4],cells[5],cells[6]}, {cells[7],cells[8],cells[9]} }
end

function Board:columns()
  return { {cells[1],cells[4],cells[7]}, {cells[2],cells[5],cells[8]}, {cells[3],cells[6],cells[9]} }
end

function Board:diagonal_forward()
  return {cells[3],cells[5],cells[7]}
end

function Board:diagonal_back()
  return {cells[1],cells[5],cells[9]}
end

function Board:possible_winning_combinations()
  p = {}
  for k,v in ipairs(board:rows()) do
    table.insert(p, v)
  end
  for k,v in ipairs(board:columns()) do
    table.insert(p, v)
  end
  table.insert(p, board:diagonal_forward())
  table.insert(p, board:diagonal_back())
  return p
end