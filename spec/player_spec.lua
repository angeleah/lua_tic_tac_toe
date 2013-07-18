require('busted')
require('player')

describe('Player', function()

  before_each(function()
    player = Player:new()
  end)

  it('sets and gets a mark', function()
    player:set_mark("Z")
    assert.are.same(player:mark(mark), "Z")
  end)
end)