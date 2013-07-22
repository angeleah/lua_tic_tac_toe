require 'busted'
require 'message'

describe('Message', function()

  before_each(function()
    message = Message:new()
  end)

  it('return a single message', function()
    assert.are.same("Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\n", message:retrieve("welcome"))
  end)

  it('return a single message', function()
    assert.are.same("Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\nCreate a player.\n", message:retrieve("welcome", "create_player"))
  end)
end)