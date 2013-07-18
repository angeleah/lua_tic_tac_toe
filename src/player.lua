require('middleclass')

Player = class('Player')

function Player:set_mark(mark)
  player_mark = mark
end

function Player:mark()
  return player_mark
end