require 'ai'
require 'board'
require 'computer_player'
require 'game'
require 'human_player'
require 'message'
require 'middleclass'
require 'scoring'
require 'validate'

local inspect = require 'inspect'

Runner = class('Runner')

function Runner:initialize()
  self.ui = Ui:new()
  self.validate = Validate:new()
end

function Runner:start_the_game()
  self.game = Game:new()
  self.ui:display_message({"welcome", "create_player", "determine_player_type"})
  local type_1 = self:get_player_type()
  self.ui:display_message({"select_player_mark"})
  local mark_1 = self:get_player_mark()
  self.ui:display_message({"determine_player_type"})
  local type_2 = self:get_player_type()
  self.ui:display_message({"select_player_mark"})
  local mark_2 = self:get_player_mark()
  self:create_player(type_1, mark_1)
  self:create_player(type_2, mark_2)
  local state = self.game:prepare_display_state()
  self.ui:display_board(state)
  self:play_game()
  self:end_game()
  if self:play_again() then
    self:start_the_game()
  end
end

-- function Runner:display_board(state)
--   local nl = "\n"
--   local sp = " "
--   local pipe = "|"
--   local separator = "---+---+---"
--   io.stdout:write("\n "..state[1].." | "..state[2].." | "..state[3].." \n".."---+---+---".."\n \n "..state[4].." | "..state[5].." | "..state[6].." \n".."---+---+---".."\n \n "..state[7].." | "..state[8].." | "..state[9].." \n\n")
-- end

-- function Runner:play_game()
--   while not self.game:is_over() do
--     local player_1_move = self:get_move(1)
--     local state = self.game:make_move_player(1, player_1_move)
--     self:display_board(state)
--     if self:game_is_over() then
--       break
--     end
--     local player_2_move = get_move(2)
--     local state = self.game:make_move_player(2, player_2_move)
--     self:display_board(state)
--   end
-- end

-- function Runner:end_game()
--   local result = self.game:result()
--   self:display_message(result)
-- end

function Runner:get_player_type()
  local type = self.ui:read_input()
  while not self.validate:player_choice(type) do
    self.ui:display_message({"invalid_selection", "determine_player_type"})
    type = self.ui:read_input()
  end
  return string.upper(type)
end

function Runner:get_player_mark()
 local mark = self.ui:read_input()
    while not self.validate:mark_input(mark) do
      self.ui:display_message({"invalid_selection", "select_player_mark"})
      local mark = self.ui:read_input()
    end
    return string.upper(mark)
end

function Runner:create_player(type, mark)
  if type == "H" then
    self.game:create_human_player(mark)
  elseif type == "C" then
    self.game:create_computer_player(mark)
  end
end

-- function Runner:get_human_move()
--   self.ui:display_message({"select_square"})
--   local cell_number = self.ui:read_input()
--   while not self.validate:number_input(cell_number) or self.game:square_taken(cell_number) == true do
--     self.ui:display_message({'invalid_selection', 'select_square'})
--     local cell_number = self.ui:read_input()
--   end
--   cell_number = cell_number
--   return cell_number
-- end


-- function Runner:get_move(player)
--   local move = self:get_player_move(player)
--   if move == false then
--     move = get_human_move
--   end
--   return move
-- end

-- function Runner:get_player_move(player)
--   local move = self.game.players[player]:get_move(self.board)
--   return move
-- end


-- function Runner:play_again()
--   self.ui:display_message({"play_again"})
--   local choice = self.ui:read_input()
--   while not self.validate:play_again_input(choice) do
--     self.ui:display_message({"invalid_selection", "play_again"})
--     local choice = self.ui:read_input()
--   end
--   choice = choice.upper()
--   if choice == "N" then
--     return false
--   elseif choice == "Y" then
--     return true
--   end
-- end
