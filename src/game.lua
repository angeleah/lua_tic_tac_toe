require 'board'
require 'computer_player'
require 'human_player'
require 'middleclass'
require 'scoring'
require 'validate'

Game = class('Game')

function Game:initialize()
  self.board = Board:new()
  self.scoring = Scoring:new(board)
  self.validate = Validate:new()
  self.players = {}
end

function Game:board_set(space, mark)
  self.board:set(space, mark)
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
  for k,v in pairs(self:gather_board_state()) do
    if v == " " then
      table.insert(prepared_board, tostring(k))
    else
      table.insert(prepared_board, v)
    end
  end
  return prepared_board
end

function Game:move_valid(move)
  local valid_moves = {1, 2, 3, 4, 5, 6, 7, 8, 9}
   for _,v in pairs(valid_moves) do
    if v == move then
      return true
    end
  end
  return false
end

function Game:is_over()
  if self.scoring:winner(self.board) or self.scoring:draw(self.board) then
    return true
  else
    return false
  end
end

function Game:result()
  local message_key = "draw"
  for k,player in pairs(self.players) do
    if self.scoring:winning_mark(self.board) == player.mark then
       message_key = "player_"..tostring(k).."_win"
       return message_key
    end
  end
  return message_key
end

function Game:get_player_move(player)
  local move = self.players[player]:get_move(self.board)
  return move
end

function Game:player_can_make_move(player)
  if self:get_player_move(player) ~= false then
    return true
  elseif self:get_player_move(player) == false then
    return false
  end
end