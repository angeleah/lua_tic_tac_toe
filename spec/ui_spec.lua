require 'board'
require 'busted'
require 'game'
require 'mockui'


describe('Ui', function()

  before_each(function()
    mockui = Mockui:new()
    game = Game:new()
    board = Board:new()
  end)

  it('receives input', function()
    mockui.input = 'h'
    assert.are.same('h', mockui:read_input())
  end)

  it('prints output', function()
    stub(game, "prepare_display_state")
    game.prepare_display_state({"1","2","3","4","5","6","7","8","9"})
    assert.stub(game.prepare_display_state).was.called_with({"1","2","3","4","5","6","7","8","9"})
    assert.are.same("\n 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n\n", mockui:display_board({"1","2","3","4","5","6","7","8","9"}))
  end)
end)