require 'board'
require 'busted'
require 'game'
require 'ui'


describe('Ui', function()

  before_each(function()
    result_out_string = ""
    result_in_string = ""
    test_out = result_out_string
    test_in = result_string
    ui = Ui:new(test_out, test_in)
    game = Game:new()
  end)

  it('receives input', function()
    -- stub(ui,"read_input")
    ui.read_input("Y")

    -- assert.are.same("Y", test_in)
  end)
end)