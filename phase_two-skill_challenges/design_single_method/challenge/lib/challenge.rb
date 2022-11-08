def todo_checker text 
  raise 'Not a string.' if !text.is_a? String
  raise 'Not a sentence.' if text.empty?

  array = text.split(' ')
  return false if array.length == 1
  
  text.include?('#TODO')
end