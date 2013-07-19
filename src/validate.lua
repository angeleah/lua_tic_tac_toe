require 'middleclass'

Validate = class('Validate')

function validate_with_matcher(input, matcher)
  if string.find(input, matcher) and #input == 1 then
    return true
  else
    return false
  end
end

function Validate:player_choice(input)
  return validate_with_matcher(input, "[HhCc]")
end

function Validate:mark_input(input)
  return validate_with_matcher(input, "%a")
end

function Validate:number_input(input)
  return validate_with_matcher(input, "%d")
end

function Validate:play_again_input(input)
  return validate_with_matcher(input, "[YyNn]")
end