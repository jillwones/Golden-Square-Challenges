# Challenge Method Design Recipe

## 1. Describe the Problem

> As a user     
> So that I can keep track of my tasks      
> I want to check if a text includes the string ```#TODO```.


## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
is_todo = todo_checker(text)

# is_todo is a boolean, true if text.include? '#TODO', false otherwise
# text is a string of words
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1 
todo_checker(123)
# => raise 'Not a string.'

# 2 
todo_checker('')
# => raise 'Not a sentence.'

# 3 
todo_checker('eat chocolate')
# => false

# 4
todo_checker('#TODO eat chocolate')
# => true

# 5
todo_checker('eat chocolate #TODO')
# => true

# 6
todo_checker('#TODO')
# => false

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
