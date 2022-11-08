# frozen_string_literal: true

def check_grammar(text)
  raise 'Not even a string.' unless text.is_a? String
  raise 'Not a sentence.' if text.empty?

  text[0].upcase == text[0] and text[-1] =~ /[.?!]/ ? true : false
end
