# Challenge

# Debug this program

def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1
  end
  counter.to_a.sort_by { |k, v| v }[0][0]
end


# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"

puts get_most_common_letter("the roof, the roof, the roof is on fire!")

# Discovery Debugging:

# First I p'd the counter.to_a, showed an array of arrays:

# [["t", 3], ["h", 3], ["e", 4], [" ", 8], ["r", 4], ["o", 7], ["f", 4], [",", 2], ["i", 2], ["s", 1], ["n", 1], ["!", 1]]

# it shows the most common char is a blank space, so I'll 
# remove spaces first.

# I used text.delete!(' ') for this

# now my array of arrays shows 'o' as the most common

# now i p counter.to_a.sort_by { |k, v| v }

# it prints => [["!", 1], ["n", 1], ["s", 1], ["i", 2], [",", 2], ["t", 3], ["h", 3], ["f", 4], ["r", 4], ["e", 4], ["o", 7]]

# with the most common letter being the final subarray, so 
# to access the 'o' rather than [0][0] I need [-1][0]

# DEBUGGED METHOD:

def get_most_common_letter(text)
  text.delete!(' ')
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1
  end
  counter.to_a.sort_by { |k, v| v }[-1][0]
end