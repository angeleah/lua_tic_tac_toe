require 'ai'
require 'board'
require 'busted'
require 'computer_player'

inspect = require 'inspect'

describe('Ai', function()

  before_each(function()
    board = Board:new()
    max = ComputerPlayer:new()
    max:set_mark("X")
    ai = Ai:new(max, board)
  end)

  function includes(move, possibilities)
    for _,v in pairs(possibilities) do
      if move == v then
        return true
      else
        return false
      end
    end
  end

  it('detects the opponents mark if there is one', function()
    board:set(1,"X")
    board:set(2,"O")
    assert.are.same(ai.find_opponent_mark(), "O")
  end)
end)