require 'ai'
require 'board'
require 'busted'
require 'computer_player'

describe('ComputerPlayer', function()

  it('gets a move', function()
    computer_player = ComputerPlayer:new("X")
    board = Board:new()
    ai = Ai:new(computer_player, board)
    assert.truthy(computer_player:get_move(board))
  end)
end)