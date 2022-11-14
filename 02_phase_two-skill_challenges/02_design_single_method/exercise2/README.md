# Exercise Two Method Design Recipe

## 1. Describe the Problem

> As a user    
> So that I can improve my grammar     
> I want to verify that a text starts with a capital letter and ends with a suitable
> sentence-ending punctuation mark.


## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
result = check_grammar(text)

# result is a boolean
# text is a string of words
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1 
check_grammar('')
# => fail "Not a sentence"

# 2 
check_grammar('One.')
# => true

# 3 
check_grammar('Hello, how are you')
# => false

# 4
check_grammar('hello, how are you?')
# => false

# 5
check_grammar('HELLO, how are you?')
# => true

# 6
check_grammar('Hello, how are you,')
# => false

check_grammaer('hello, how are you')
# => false

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

