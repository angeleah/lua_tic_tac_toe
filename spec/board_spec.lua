require "busted"
require "board"
require "inspect"

describe("board", function()

  before_each(function()
    board = Board:new()
  end)

  it('initializes with blank spaces', function()
    for i = 1, 9 do
      assert.are.equal(board:get(i), " ")
    end
  end)

  it('writes and reads a mark on a space', function()
    board:set(2, "X")
    assert.are.equal(board:get(2),"X")
    board:set( 6, "O")
    assert.are.equal(board:get(6),"O")
  end)

  it('can undo a move', function()
    board:set(1,"X")
    assert.are.same(board:current_state(), {"X"," "," "," "," "," "," "," "," "})
    board:undo_move(1)
    assert.are.same(board:current_state(), {" "," "," "," "," "," "," "," "," "})
  end)
end)