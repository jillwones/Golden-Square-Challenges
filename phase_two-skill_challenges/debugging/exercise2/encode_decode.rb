
# Set a timer for 10 minutes

# You challenge is to debug the program below before the 
# timer goes off. When you fix the program or the timer 
# goes off, move on to the next exercise.

def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  return plaintext_chars.join
end


# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"

# First try debug via change debugging

# managed to debug the encode method via change debugging:

def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")

# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"

# debugged decode method via discovery debugging:

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[char.ord - 65]
  end
  return plaintext_chars.join
end

puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

# => "theswiftfoxjumpedoverthelazydog"
