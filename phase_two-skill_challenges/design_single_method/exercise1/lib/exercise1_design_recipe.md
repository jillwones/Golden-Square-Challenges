# Exercise One Method Design Recipe

## 1. Describe the Problem

> As a user
> So that I can manage my time
> I want to see an estimate of reading time for a text, assuming that I can read 200 > words a minute.


## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
reading_time = calculate_reading_time(text)

# reading_time is an string representing minutes (string interpolation)
# text is a string of words
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1 
calculate_reading_time('')
# => 0 minutes

# 2 
calculate_reading_time('one')
# => 1 minute

# 3 
calculate_reading_time('TWO_HUNDRED_WORDS')
# => 1 minute

# 4
calculate_reading_time('THREE_HUNDRED_WORDS')
# => 2 minutes

# 5
calculate_reading_time('FOUR_HUNDRED_WORDS')
# => 2 minutes

# 6
calculate_reading_time('FIVE_THOUSAND_WORDS')
# => 25 minutes

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
