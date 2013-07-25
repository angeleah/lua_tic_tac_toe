require 'board'
require 'busted'
require 'computer_player'
require 'game'
require 'human_player'
require 'scoring'

local inspect = require 'inspect'

describe('Game', function()

  before_each(function()
    board = Board:new()
    scoring = Scoring:new()
    game = Game:new()
  end)

  function set_game_state()
    game:make_move(1,"X")
    game:make_move(2,"O")
    game:make_move(3,"X")
    game:make_move(4,"O")
  end

  it('creates a human player', function()
    human_player = game:create_human_player("H")
    assert.are.same("H", game.players[1].mark)
  end)

  it('creates a computer player', function()
    computer_player = game:create_computer_player("C")
    assert.are.same("C", game.players[1].mark)
  end)

  it('gathers a board state', function()
    set_game_state()
    assert.are.same({"X","O","X","O"," "," "," "," "," "}, game:gather_board_state())
  end)

  it('prepares the board for display', function()
    set_game_state()
    assert.are.same({"X","O","X","O","5","6","7","8","9"}, game:prepare_display_state())
  end)

  it('returns true on an available move', function()
    move = 7
    assert.True(game:move_available(move))
  end)

  it('returns false on a move that is not available', function()
    set_game_state()
    move = 1
    assert.False(game:move_available(move))
  end)

  it('determines that the game is over in a winner situation', function()
    game:make_move(1,"X") game:make_move(2,"X") game:make_move(3,"X")
    game:make_move(4,"O") game:make_move(5," ") game:make_move(6," ")
    game:make_move(7,"O") game:make_move(8," ") game:make_move(9," ")
    assert.True(game:is_over())
  end)

  it('determines that the game is over in a draw situation', function()
    game:make_move(1,"X") game:make_move(2,"O") game:make_move(3,"X")
    game:make_move(4,"O") game:make_move(5,"X") game:make_move(6,"X")
    game:make_move(7,"O") game:make_move(8,"X") game:make_move(9,"O")
    assert.True(game:is_over())
  end)

  it('returns a draw message key', function()
    game:create_human_player("X")
    game:create_computer_player("O")
    game:make_move(1,"X") game:make_move(2,"O") game:make_move(3,"X")
    game:make_move(4,"O") game:make_move(5,"X") game:make_move(6,"X")
    game:make_move(7,"O") game:make_move(8,"X") game:make_move(9,"O")
    assert.are.same({"draw"}, game:result())
  end)

  it('returns a win message key', function()
    game:create_human_player("X")
    game:create_human_player("O")
    game:make_move(1,"X") game:make_move(2,"O") game:make_move(3,"X")
    game:make_move(4,"O") game:make_move(5,"O") game:make_move(6,"X")
    game:make_move(7,"O") game:make_move(8,"X") game:make_move(9,"X")
    assert.are.same({"player_1_win"}, game:result())
  end)

  it('returns false if a player can not make a move', function()
    game:create_computer_player("X")
    game:create_human_player("O")
    assert.True(game:player_can_make_move(1))
  end)

  it('returns false if a player can not make a move', function()
    game:create_computer_player("X")
    game:create_human_player("O")
    assert.False(game:player_can_make_move(2))
  end)
end)