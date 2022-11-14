def make_snippet(string)
  array = string.split(' ')
  if array.length < 6
    array.join(' ')
  else
    "#{array[0..4].join(' ')}..."
  end
end