require "busted"
require "board"

describe("board", function()

  it('initializes with blank spaces', function()
    board = Board:new()
    for i = 1, 9 do
      assert.are.equal(board:get(i), " ")
    end
  end)
end)