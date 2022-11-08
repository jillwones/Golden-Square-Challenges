def check_grammar text
  fail 'Not even a string.' if !text.is_a? String
  fail 'Not a sentence.' if text.empty?
  text[0].upcase == text[0] and text[-1] =~ /[.?!]/ ? true : false
end