-- require 'busted'
-- require 'game'
-- require 'mockui'
-- require 'runner'
-- require 'validate'

-- describe('Runner', function()

--   before_each(function()
--     mockui = Mockui:new()
--     runner = Runner:new(mockui)
--     validate = Validate:new()
--   -- end)

--   it('gets the player type', function()
--     mockui.input = "h"
--     assert.are.same("H", runner:get_player_type())
--   end)

--   it('gets the player mark', function()
--     mockui.input = "a"
--     assert.are.same("A", runner:get_player_mark())
--   end)

--   it('can get a human move', function()
--     mockui.input = "3"
--     runner:create_game()
--     assert.are.same("3", runner:get_human_move())
--   end)

--   it('gives the option to play again', function()
--     mockui.input = 3
--     assert.True(runner:play_again())
--   end)
-- end)