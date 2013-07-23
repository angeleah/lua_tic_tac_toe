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

function Runner:initialize(ui)
  self.ui = ui
  self.validate = Validate:new()
end

function Runner:start_the_game()
  self.create_game()
  self.ui.display_message("welcome", "create_player", "determine_player_type")
  local type_1 = self:get_player_type()
  self.ui.display_message("select_player_mark")
  local mark_1 = self:get_player_mark()
  self.ui.display_message("determine_player_type")
  local type_2 = self:get_player_type()
  self.ui.display_message("select_player_mark")
  local mark_2 = self:get_player_mark()
  create_player(type_1, mark_1)
  create_player(type_2, mark_2)
  state = self.game.prepare_display_state
  self.ui.display_board(state)
  self.play_game()
  self.end_game()
  if self.play_again() then
    self.start_the_game()
  end
end

function Runner:play_game()
  while  not self.game_is_over do

  end
end

function Runner:get_player_type()
  local type = self.ui:read_input()
  while self.validate:player_choice(type) == false do
    self.ui.display_message("invalid_selection", "determine_player_type")
    type = self.ui:read_input()
  end
  return type.upper
end

