require 'board'
require 'busted'
require 'scoring'

describe('Scoring', function()

  before_each(function()
    board = Board:new()
    scoring = Scoring:new()
  end)

  function set_board_state(num_squares)
    for i = 1, num_squares do
      board:set(i, "X")
    end
  end

  it('does not determine a winner with a board of all spaces',function()
    assert.False(scoring:winner(board))
  end)

  it('does not return a winner for 3 in a row with mixed symbols', function()
    set_board_state(2)
    board:set(3, "O")
    assert.False(scoring:winner(board))
  end)

  it('detects a winner with a horizontal winning board',function()
    set_board_state(3)
    assert.True(scoring:winner(board))
  end)

  it('detects a winner with a vertical winning board',function()
    board:set(1, "X")
    board:set(4, "X")
    board:set(7, "X")
    assert.True(scoring:winner(board))
  end)

  it('detects a winner with a diagonal forward winning board',function()
    board:set(3, "X")
    board:set(5, "X")
    board:set(7, "X")
    assert.True(scoring:winner(board))
  end)

  it('detects a winner with a diagonal back winning board',function()
    board:set(1, "X")
    board:set(5, "X")
    board:set(9, "X")
    assert.True(scoring:winner(board))
  end)

  it('determines if O was the winner', function()
    board:set(1, "O")
    board:set(2, "O")
    board:set(3, "O")
    assert.are.same(scoring:winning_mark(board), "O")
  end)

  it('determines if X was the winner', function()
    set_board_state(3)
    assert.are.same(scoring:winning_mark(board), "X")
  end)

  it('determines if the game was a draw', function()
    board:set(1,"X")
    board:set(2,"O")
    board:set(3,"X")
    board:set(4,"X")
    board:set(5,"O")
    board:set(6,"X")
    board:set(7,"O")
    board:set(8,"X")
    board:set(9,"O")
    assert.True(scoring:draw(board))
  end)
end)