require 'ai'
require 'board'
require 'busted'
require 'computer_player'

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

  function set_ai_win_board()
    board:set(1,"X") board:set(2,"X") board:set(3,"X")
    board:set(4,"O") board:set(5," ") board:set(6," ")
    board:set(7,"O") board:set(8," ") board:set(9," ")
  end

  function set_draw_board()
    board:set(1,"X") board:set(2,"O") board:set(3,"X")
    board:set(4,"O") board:set(5,"X") board:set(6,"X")
    board:set(7,"O") board:set(8,"X") board:set(9,"O")
  end

  function set_ai_loss_board()
    board:set(1,"O") board:set(2," ") board:set(3,"X")
    board:set(4,"X") board:set(5,"X") board:set(6," ")
    board:set(7,"O") board:set(8,"O") board:set(9,"O")
  end

  function set_in_progress_board()
    board:set(1,"X") board:set(2," ") board:set(3," ")
    board:set(4,"O") board:set(5," ") board:set(6," ")
    board:set(7," ") board:set(8," ") board:set(9," ")
  end

  it('detects the opponents mark if there is one', function()
    board:set(1,"X")
    board:set(2,"O")
    assert.are.same("O", ai:find_opponent_mark())
  end)

  describe('terminal state detection', function()

    it('determines that the state is not terminal when the the game is still in progress', function()
      set_in_progress_board()
      assert.False(ai:state_is_terminal())
    end)

    it('determines that the state is terminal when result is a draw', function()
      set_draw_board()
      assert.True(ai:state_is_terminal())
    end)

    it('determines that the state is terminal when there is a winner', function()
      set_ai_win_board()
      assert.True(ai:state_is_terminal())
    end)
  end)

  describe('board evaluation', function()

    it('evaluates the board positively for an ai win', function()
      set_ai_win_board()
      assert.are.same(1, ai:evaluate_the_board())
    end)

    it('evaluates the board negativly for an ai loss', function()
      set_ai_loss_board()
      assert.are.same(-1, ai:evaluate_the_board())
    end)

    it('evaluates the board neutrally for a draw situation', function()
      set_draw_board()
      assert.are.same(0, ai:evaluate_the_board())
    end)
  end)

  describe('minimax', function()

    it('selects an optimal move on a board of all blank spaces', function()
      optimal_moves = {0,2,4,6,8}
      assert.True(includes(ai:select_optimal_start_move(), optimal_moves))
    end)

    it('finds the best move with one terminal state move available', function()
      board:set(1,"X") board:set(2,"O") board:set(3,"X")
      board:set(4,"O") board:set(5,"O") board:set(6," ")
      board:set(7,"O") board:set(8,"X") board:set(9,"X")
      assert.are.same(6, ai:find_best_move())
    end)

    it('finds the best move with one terminal state and one loss state available',  function()
      board:set(1,"O") board:set(2,"X") board:set(3,"O")
      board:set(4,"X") board:set(5,"O") board:set(6,"O")
      board:set(7,"X") board:set(8," ") board:set(9," ")
      assert.are.same(9, ai:find_best_move())
    end)

    it('selects 8 as the best move for this board', function()
      board:set(1,"X") board:set(2,"O") board:set(3," ")
      board:set(4,"O") board:set(5,"O") board:set(6,"X")
      board:set(7,"X") board:set(8," ") board:set(9," ")
      assert.are.same(8, ai:find_best_move())
    end)

    it('selects 2 as the best move for this board', function()
      board:set(1," ") board:set(2," ") board:set(3," ")
      board:set(4," ") board:set(5,"O") board:set(6," ")
      board:set(7,"X") board:set(8,"O") board:set(9,"X")
      assert.are.same(2, ai:find_best_move())
    end)

    it('selects 5 as the best move for this board', function()
      board:set(1,"X") board:set(2," ") board:set(3," ")
      board:set(4,"O") board:set(5," ") board:set(6,"O")
      board:set(7," ") board:set(8," ") board:set(9," ")
      assert.are.same(5, ai:find_best_move())
    end)

    it('selects 4 as the best move for this board', function()
      board:set(1,"X") board:set(2," ") board:set(3,"O")
      board:set(4," ") board:set(5," ") board:set(6," ")
      board:set(7," ") board:set(8," ") board:set(9," ")
      assert.are.same(4, ai:find_best_move())
    end)
  end)
end)