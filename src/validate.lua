require 'middleclass'

Validate = class('Validate')

function Validate:player_choice(input)
  return self:validate_with_matcher(input, "[HhCc]")
end

function Validate:mark_input(input)
  return self:validate_with_matcher(input, "%a")
end

function Validate:number_input(input)
  print('input is')
  print(input)
  return self:validate_with_matcher(input, "%d")
end

function Validate:play_again_input(input)
  return self:validate_with_matcher(input, "[YyNn]")
end

function Validate:validate_with_matcher(input, matcher)
  if string.find(input, matcher) and #input == 1 then
    return true
  else
    return false
  end
end