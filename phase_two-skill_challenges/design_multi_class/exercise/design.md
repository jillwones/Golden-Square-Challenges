# Multi-Class Planned Design Recipe

## 1. Describe the Problem
 
> As a user  
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries


## 2. Design the Class System

```ruby
class Diary
  def initialize
    # initialises @diary = [] that stores instances of the DiaryEntry class
  end
  
  def add(diary_entry)
    # instance of DiaryEntry as parameter, raises error otherwise
    # adds diary_entry to @diary array
    # returns nothing
  end
  
  def all
    # raises 'empty diary' if no diary_entries added yet
    # returns a list of all the entires
  end
  
  def find_best_entry_for_reading_time(wpm, minutes)
    # wpm and minutes are both integers
    # raises errors if diary empty, wpm <= 0 or minutes <= 0
    # raises 'all entries too long' if all entries contain more words than the user can read with the given wpm and minutes
    # will call on the reading_time method in DiaryEntry
    # returns the diary entry with the most words the user can get through in the given wpm and minutes
  end
  
  def see_all_contacts
    # will show all of the contacts + their numbers based on the phone numbers found in the diary entries
    # will set all_contacts = []
    # loop through the diary entries and loop through the contacts within, then check if diary entries include? the contact.number.to_s
    # if true then add "#{contact.name} - #{contact.number}" to the all_contacts array
    # then returns all_contacts.join(', '), if that is an empty string then return 'no contacts found within diary'
  end
end

class DiaryEntry
  attr_reader :title, :content # to access the title and contents of a given entry
  
  def initialize(title, content)
    # initialises title and content, both are strings
  end
  
  def word_count
    # calculates the num of words in the entry
    # returns num of words as an integer
  end
  
  def reading_time(wpm)
    # wpm is an integer, words per minute
    # calls on word_count to calculate reading time for the entry this method is called on
    # returns an integer that will give an estimate for reading time in minutes
  end
end

class TodoList
  def initialize
    # @todo_list = []
  end
  
  def add(todo)
    # todo is an instance of Todo
    # adds the todo to @todo_list
    # returns nothing
  end
  
  def list_all
    # will puts todo's like: ["Todos:", "* Walk the dog", "* Do homework"].join("\n") + "\n"
  end
end

class Todo
  attr_reader :task # so the todo's task can be accessed
  
  def initialize(task)
    @task = task
  end
end

class Contacts

  attr_reader :contacts
  
  def initialize
    @contacts = []
  end
  
  def add(contact)
    # parameter is an instance of Contact
    # adds to the @contacts array
  end
end

class Contact
  attr_reader :name, :number
  
  def initialize(name, number)
    # name is a string
    # number is an 11 digit integer, raise error if not
  end
end

```
 
## 3. Create Examples as Integration Tests
 
```ruby
# 1 
# TodoList#list_all puts all todos in the list:
todo_list = TodoList.new
todo_1 = Todo.new('Walk the dog')
todo_2 = Todo.new('Clean house')
todo_list.add(todo_1)
todo_list.add(todo_2)
expected = ["All TODOS:", "* Walk the dog", "* Clean house].join("\n") + "\n"
expect{ todo_list.list_all }.to output(expected).to_stdout

# 2 
# Contacts#contacts will return an array of contacts (maybe I shouldnt have called everything contacts haha)
iphone = Contacts.new
contact_1 = Contact.new('Bob',01234567893)
contact_2 = Contact.new('Jill',03040294820)
iphone.add(contact_1)
iphone.add(contact_2)
expect(iphone.contacts).to eq([contact_1, contact_2])

# 3
```
 
## 4. Create Examples as Unit Tests
 
Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail.
 
Encode one of these as a test and move to step 5.
 
## 5. Implement the Behaviour
 
For each example you create as a test, implement the behaviour that allows the
class to behave according to your example.
 
Then return to step 3 until you have addressed the problem you were given. You
may also need to revise your design, for example if you realise you made a
mistake earlier.
