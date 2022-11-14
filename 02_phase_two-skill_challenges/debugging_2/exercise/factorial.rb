def factorial(n)
  product = 1
  while n > 0
    binding.irb # Mystery new line!
    n -= 1
    product *= n
  end
  product
end

p factorial(5) # expected 120, getting 0

# debugged below: 

# def factorial(n)
#   product = 1
#   while n > 0
#     product *= n
#     n -= 1
#   end
#   product
# end