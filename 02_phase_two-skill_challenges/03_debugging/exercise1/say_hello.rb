# Set a timer for 10 minutes.

# Your challenge is to debug the program below before the timer goes off. 
# When you fix the program or the timer goes off, move on to the next exercise.

def say_hello(name)
  return "hello #(name)"
end

# Intended output:
#
# > say_hello("kay")
# => "hello kay"

def say_hello(name)
  "hello #{name}"
end 

puts say_hello('kay')