require 'busted'
require 'validate'

describe('Validate', function()

  before_each(function()
    validate = Validate:new()
  end)

  it('only accepts h or c as the player choice', function()
    assert.True(validate:player_choice("H"))
    assert.False(validate:player_choice("Q"))
  end)

  it('only accepts letters when asked for player marker letters', function()
    assert.True(validate:mark_input("B"))
    assert.False(validate:mark_input("qr"))
    assert.False(validate:mark_input("3"))
  end)

  it('only accepts valid number input for spaces', function()
    assert.True(validate:number_input("4"))
    assert.False(validate:number_input("765"))
    assert.False(validate:number_input("A"))
  end)

  it('only accepts y or n as choices for playing again', function()
    assert.True(validate:play_again_input("Y"))
    assert.False(validate:play_again_input("No"))
    assert.False(validate:play_again_input("8"))
  end)
end)