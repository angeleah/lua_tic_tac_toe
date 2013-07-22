require 'middleclass'

Message = class('Message')

function Message:initialize()
  self.messages = {
    ["welcome"] = "Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.",
    ["create_player"] = "Create a player.",
    ["determine_player_type"] = "Do you want the player to be human or computer? (human/computer)",
    ["select_player_mark"] = "Please select a single letter to represent the player.",
    ["invalid_selection"] = "That is an invalid selection, please make a valid selection.",
    ["select_square"] = "Please select an open square.",
    ["player_1_win"] = "Player 1 is the winner!",
    ["player_2_win"] = "Player 2 is the winner!",
    ["draw"] = "It's a draw.",
    ["play_again"] = "Would you like to play again? (Y/N)",
  }
end

function Message:retrieve(...)
  self.full_message = ""
  for i,v in pairs({...}) do
    self.full_message = self.full_message .. self.messages[v] .. "\n"
  end
  return self.full_message
end