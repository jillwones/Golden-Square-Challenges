# Exercise Method Design Recipe - Class Design

## 1. Describe the Problem

> As a user     
> So that I can keep track of my tasks     
> I want a program that I can add todo tasks to and see     
> a list of them

> As a user      
> So that I can focus on tasks to complete      
> I want to mark tasks as complete and have them disappear from the list

## 2. Design the Class Interface

Class name: TodoList
Design of the initializer and parameters it takes: It will take no parameters but it initialises @todolist as an empty array.

Public methods:
1. #add
  * It's purpose is to add a string to the @todolist array
  * Takes a string (todo) as a parameter
  * Doesn't return anything

2. #completed
  * It's purpose it to mark tasks as complete and delete them from the array of todos
  * Takes a string as a parameter
  * Returns nothing

3. #list
  * Shows current todo list
  * Takes no parameters
  * Returns list of todos as strings

Steps 3 and 4 then operate as a cycle.

## 3. Create Examples as Tests

```ruby
# 1
todolist = TodoList.new 
todolist.list # => []

# 2
todolist = TodoList.new 
todolist.add('Walk the dog')
todolist.list # => ['Walk the dog']

# 3
todolist = TodoList.new 
todolist.add('Walk the dog')
todolist.add('Do homework')
todolist.list # => ['Walk the dog', 'Do homework']

# 4
todolist = TodoList.new 
todolist.add('Walk the dog')
todolist.add('Do homework')
todolist.completed('Walk the dog')
todolist.list # => ['Do homework']

# 5
todolist = TodoList.new 
todolist.add('Walk the dog')
todolist.complete('Do homework') # => raises error 'This task is not on your todo list.'
```

## 4. Implement the Behaviour

For each example you create as a test, implement the behaviour that allows the
class to behave according to your example.

At this point you may wish to apply small-step test-driving to manage the
complexity. This means you only write the minimum lines of the example to get
the test to fail (red), then make it pass (green) and refactor, before adding
another line to the test until it fails, then continue.

Then return to step 3 until you have addressed the problem you were given. You
may also need to revise your design, for example if you realise you made a
mistake earlier.
