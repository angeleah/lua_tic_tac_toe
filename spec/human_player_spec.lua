require 'board'
require 'busted'
require 'human_player'

describe('HumanPlayer', function()

  it('returns false when get move is called', function()
    human_player = HumanPlayer:new("X")
    board = Board:new()
    assert.False(human_player:get_move(board))
  end)
end)