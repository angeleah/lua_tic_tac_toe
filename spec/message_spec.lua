require 'busted'
require 'message'

describe('Message', function()

  before_each(function()
    message = Message:new()
  end)

  it('return a single message', function()
    assert.are.same(message:retrieve("welcome"),"Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\n")
  end)

  it('return a single message', function()
    assert.are.same(message:retrieve("welcome", "create_player"), "Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\nCreate a player.\n")
  end)
end)