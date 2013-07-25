require 'board'
require 'computer_player'
require 'human_player'
require 'middleclass'
require 'scoring'
require 'validate'

Game = class('Game')

local inspect = require 'inspect'

function Game:initialize()
  self.board = Board:new()
  self.scoring = Scoring:new(self.board)
  self.validate = Validate:new()
  self.players = {}
end

function Game:make_move(move, mark)
  print(" the move and the mark that will be marked are")
  print(inspect(move))
  print(inspect(mark))
  print("move type is")
  print(inspect(type(move)))
  self.board:set(tonumber(move), mark)
end

function Game:create_human_player(mark)
  local human_player = HumanPlayer:new()
  human_player:set_mark(mark)
  table.insert(self.players, human_player)
end

function Game:create_computer_player(mark)
  local computer_player = ComputerPlayer:new()
  computer_player:set_mark(mark)
  table.insert(self.players, computer_player)
end

function Game:gather_board_state()
  return self.board:current_state()
end

function Game:prepare_display_state()
  local prepared_board = {}
  local current_board_state = self:gather_board_state()
  for k,v in pairs(current_board_state) do
    if v == " " then
      table.insert(prepared_board, tostring(k))
    else
      table.insert(prepared_board, v)
    end
  end
  return prepared_board
end

function Game:is_over()
  if self.scoring:winner() or self.scoring:draw() then
    return true
  else
    return false
  end
end

function Game:result()
  local message_key = {"draw"}
  for k,player in pairs(self.players) do
    if self.scoring:winning_mark() == player.mark then
       message_key = {"player_"..tostring(k).."_win"}
       return message_key
    end
  end
  return message_key
end

function Game:get_player_move(player)
  print(inspect(player))
  print("get player move for")
  print(inspect(self.players[player].mark))
  local move = self.players[player]:get_move(self.board)
  return move
end

function Game:make_move_player(player, move)
  local mark = self.players[player].mark
  print('mark of the player going to make the move is')
  print(mark)
  print("move of the player going to make the move is")
  print(move)
  self:make_move(move, mark)
  return self:prepare_display_state()
end

function Game:move_available(cell)
  return not self.board:cell_occupied(cell)
end

function Game:player_can_make_move(player)
  if self:get_player_move(player) ~= false then
    return true
  elseif self:get_player_move(player) == false then
    return false
  end
end