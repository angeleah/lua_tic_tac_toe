require 'ai'
require 'computer_player'
require 'game'
require 'human_player'
require 'message'
require 'middleclass'
require 'scoring'
require 'ui'
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
  self.type_1 = self:get_player_type()
  self.ui:display_message({"select_player_mark"})
  self.mark_1 = self:get_player_mark()
  self.ui:display_message({"determine_player_type"})
  self.type_2 = self:get_player_type()
  self.ui:display_message({"select_player_mark"})
  self.mark_2 = self:get_player_mark()
  self:create_player(self.type_1, self.mark_1)
  self:create_player(self.type_2, self.mark_2)
  print("player 1 mark-")
  print(inspect(self.game.players[1].mark))
  print("player 2  mark-")
  print(inspect(self.game.players[2].mark))
  local state = self.game:prepare_display_state()
  print("prepared display state is")
  print(inspect(state))
  self.ui:display_board(state)
  self:play_game()
  self:end_game()
  if self:play_again() then  -- try repeat until
    self:start_the_game()
  end
end

function Runner:create_player(type, mark)
  if type == "H" then
    print("creating human player")
    self.game:create_human_player(mark)
  elseif type == "C" then
    print("creating computer player")
    self.game:create_computer_player(mark)
  end
end

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
      mark = self.ui:read_input()
    end
    return string.upper(mark)
end

function Runner:play_game()
  while not self.game:is_over() do
    local player_1_move = self:get_move(1)
    print("player 1 move")
    print(inspect(player_1_move))
    print("current_board_state inside of play game is")
    print(inspect(self.game:gather_board_state()))
    local state = self.game:make_move_player(1, player_1_move)
    self.ui:display_board(state)
    if self.game:is_over() then
      return
    end
    local player_2_move = self:get_move(2)
    state = self.game:make_move_player(2, player_2_move)
    self.ui:display_board(state)
  end
end

function Runner:get_move(player)
  local move = self.game:get_player_move(player)
  print("move in get move is")
  print(inspect(move))
  if move == false then
    move = self:get_human_move()
  end
  return move
end

function Runner:end_game()
  local result = self.game:result()
  self.ui:display_message(result)
end

function Runner:get_human_move()
  self.ui:display_message({"select_square"})
  local cell_number = self.ui:read_input()
  print("cell number is ")
  print(inspect(cell_number))
  print("the current board state is")
  print(inspect(self.game:gather_board_state()))
  while not self.validate:number_input(cell_number) or  not self.game:move_available(tonumber(cell_number)) do
    self.ui:display_message({'invalid_selection', 'select_square'})
    cell_number = self.ui:read_input()
  end
  cell = cell_number
  return cell
end

function Runner:play_again()
  self.ui:display_message({"play_again"})
  local choice = self.ui:read_input()
  print('play again choice is')
  print(inspect(choice))
  while not self.validate:play_again_input(choice) do
    self.ui:display_message({"invalid_selection", "play_again"})
    choice = self.ui:read_input()
  end
  choice = string.upper(choice)
  if choice == "N" then
    return false
  elseif choice == "Y" then
    return true
  end
end
