require 'busted'
require 'board'
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

  it('detects a winner with a winning board',function()
    set_board_state(3)
    assert.True(scoring:winner(board))
  end)
end)