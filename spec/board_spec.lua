require 'board'
require 'busted'

describe('Board', function()

  before_each(function()
    board = Board:new()
  end)

  describe('cell manipulation', function()

    function set_board_state(num_squares)
      for i = 1, num_squares do
        board:set(i, "X")
      end
    end

    it('initializes with blank spaces', function()
      for i = 1, 9 do
        assert.are.same(" ", board:get(i))
      end
    end)

    it('writes to and reads from a cell', function()
      set_board_state(1)
      assert.are.equal("X", board:get(1))
    end)

    it('can undo a move', function()
      set_board_state(1)
      assert.are.same({"X"," "," "," "," "," "," "," "," "}, board:current_state())
      board:undo_move(1)
      assert.are.same({" "," "," "," "," "," "," "," "," "}, board:current_state())
    end)

    it('clears the spaces', function()
      set_board_state(9)
      assert.are.same({"X","X","X","X","X","X","X","X","X"}, board:current_state())
      board:clear_all_spaces()
      assert.are.same({" "," "," "," "," "," "," "," "," "}, board:current_state())
    end)

    it('finds available spaces', function()
      set_board_state(7)
      assert.are.same({8,9}, board:available_spaces())
    end)

    it('detects if a square is occupied',function()
      set_board_state(1)
      assert.True(board:cell_occupied(1))
      assert.False(board:cell_occupied(2))
    end)
  end)

  describe('board regions', function()

    before_each(function()
      board:set(2, "X")
      board:set(7, "O")
      board:set(9, "X")
    end)

    it('gets the rows of a board',function()
      assert.are.same(3, #board:rows())
      assert.are.same({{" ", "X", " "},
                       {" ", " ", " "},
                       {"O", " ", "X"}}, board:rows())
    end)

    it('gets the columns of a board', function()
      assert.are.same(3, #board:columns())
      assert.are.same({{" ", " ", "O"},
                       {"X", " ", " "},
                       {" ", " ", "X"}}, board:columns())
    end)

    it('gets the diagonal forward positions', function()
      assert.are.same({ " ", " ", "O"}, board:diagonal_forward())
    end)

    it('gets the diagonal back positions', function()
      assert.are.same({ " ", " ", "X"}, board:diagonal_back())
    end)

    it('finds all possible winning combinations', function()
      assert.are.same({{" ", "X", " "},
                       {" ", " ", " "},
                       {"O", " ", "X"},
                       {" ", " ", "O"},
                       {"X", " ", " "},
                       {" ", " ", "X"},
                       {" ", " ", "O"},
                       {" ", " ", "X"}}, board:possible_winning_combinations())
    end)
  end)
end)

