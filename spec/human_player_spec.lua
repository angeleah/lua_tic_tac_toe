require 'busted'
require 'human_player'
require 'board'

describe('HumanPlayer', function()

  it('returns false when get move is called', function()
    human_player = HumanPlayer:new("X")
    assert.False(human_player:get_move())
  end)
end)