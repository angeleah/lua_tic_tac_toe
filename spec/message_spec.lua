require 'busted'
require 'message'

describe('Message', function()

  before_each(function()
    message = Message:new()
  end)

  it('return a single message', function()
    assert.are.same(("Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\n"), message:retrieve({"welcome"}))
  end)

  it('return a multi message', function()
    assert.are.same("Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\nCreate a player.\nDo you want the player to be human or computer? (h/c)\n", message:retrieve({"welcome", "create_player", "determine_player_type"}))
  end)
end)