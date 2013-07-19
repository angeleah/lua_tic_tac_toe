require 'busted'
require 'computer_player'
require 'board'
require 'ai'

describe('ComputerPlayer', function()

  it('gets a move', function()
    computer_player = ComputerPlayer:new("X")
    board = Board:new()
    ai = Ai:new(player, board)
    assert.truthy(computer_player:get_move(board))
  end)
end)