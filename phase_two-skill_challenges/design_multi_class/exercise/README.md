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
  
  def check_diary_for_phone_numbers(contacts)
    # parameter is an instance of contacts and should be an array of contacts
    # will show all of the contacts + their numbers based on the phone numbers found in the diary entries
    # will set answer = []
    # loop through the @diary and loop through the contacts within, then check if @diary array include? the contact.number.to_s
    # if true then add "#{entry.title} - #{contact.name} - #{contact.number}" to the answer array
    # then returns answer.join(', '), if that is an empty string then return 'no contacts found within diary'
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
    # i suppose can be a private method
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
# TodoList#list_all putses all todos on the todo_list:
todo_list = TodoList.new
todo_1 = Todo.new('Walk the dog')
todo_2 = Todo.new('Clean house')
todo_list.add(todo_1)
todo_list.add(todo_2)
expected = ["All TODOS:", "* Walk the dog", "* Clean house"].join("\n") + "\n"
expect{ todo_list.list_all }.to output(expected).to_stdout

# 2 
# Contacts#contacts returns an array of contacts (maybe I shouldnt have called everything contacts haha)
iphone = Contacts.new
contact_1 = Contact.new('Bob', 01234567893)
contact_2 = Contact.new('Jill', 03040294820)
iphone.add(contact_1)
iphone.add(contact_2)
expect(iphone.contacts).to eq([contact_1, contact_2])

# 3
# Diary#all return all diary entries in the Diary
diary = Diary.new
entry_1 = DiaryEntry.new('Title', 'Contents')
entry_2 = DiaryEntry.new('Title 2', 'Contents 2')
diary.add(entry_1)
diary.add(entry_2)
expect(diary.all).to eq([entry_1, entry_2])

# 4
# Diary#find_best_entry_for_reading_time returns the entry if it has got the exact amount of words they can read in the given time
diary = Diary.new
diary_entry1 = DiaryEntry.new("title1","one " * 100)
diary_entry2 = DiaryEntry.new("title2","two " * 200)
diary.add(diary_entry1)
diary.add(diary_entry2)
expect(diary.find_best_entry_for_reading_time(100,2)).to eq(diary_entry2)

# 5
# Diary#find_best_entry_for_reading_time returns the entry if it has got less than the amount of words they can read in the given time but is the closest
diary = Diary.new
diary_entry1 = DiaryEntry.new("title1","one " * 100)
diary_entry2 = DiaryEntry.new("title2","two " * 200)
diary.add(diary_entry1)
diary.add(diary_entry2)
expect(diary.find_best_entry_for_reading_time(99,2)).to eq(diary_entry1)

# 6
# Diary#find_best_entry_for_reading_time raises error if 1 entry present but not readable in amount of time 
diary = Diary.new
diary_entry1 = DiaryEntry.new("title1","one " * 1000)
diary.add(diary_entry1)
diary.add(diary_entry2)
expect{ diary.find_best_entry_for_reading_time(200,1) }.to raise_error('All entries are too long.')

# 7
# Diary#check_diary_for_phone_numbers returns all of the entries that contain numbers found in a certain contacts list
my_diary = Diary.new
entry1 = DiaryEntry.new("title1", "random words 46372364831 more random words")
entry2 = DiaryEntry.new("title2", "no number in this one")
entry3 = DiaryEntry.new("title3", "random 36473920463 words more random")
my_diary.add(entry1)
my_diary.add(entry2)
my_diary.add(entry3)
iphone_list = Contacts.new
contact1 = Contact.new('Bob', 46372364831)
contact2 = Contact.new('Jill', 36473920463)
contact3 = Contact.new('Fred', 29462950321)
iphone_list.add(contact1)
iphone_list.add(contact2)
iphone_list.add(contact3)
expected = "title1 - Bob - 01234567891, title3 - Jill - 36473920463"
expect(my_diary.check_diary_for_phone_numbers).to eq(expected)
```
 
## 4. Create Examples as Unit Tests
 
```ruby
# TODO UNIT TESTS
# 1
# Todo#task returns the todo task
todo_1 = Todo.new('Walk the dog')
expect(todo_1.task).to eq('Walk the dog')

# 2
# Todo initializing raises error if task is not a string
expect{ Todo.new([123]) }.to raise_error('Task must be a string')

# TODOLIST UNIT TESTS
# 1
# TodoList#list_all raises error if no todos in list
todo_list = TodoList.new
expect{ todo_list.list_all }.to raise_error('No todos in the list')

# CONTACT UNIT TESTS
# 1
# Contact#name returns the name of the contact
contact_1 = Contact.new('Bob', 01725362718)
expect(contact_1.name).to eq('Bob')

# 2
# Contact#number returns the number of the contact
contact_1 = Contact.new('Bob', 01725362718)
expect(contact_1.number).to eq(01725362718)

# 3
# Contact initializing raises error if number is not an 11 digit integer
expect{ Contact.new('Bob', 'string here') }.to raise_error('Number must be an integer and 11 digits long')
expect{ Contact.new('Bob', 1234) }.to raise_error('Number must be an integer and 11 digits long')

# CONTACTS UNIT TESTS
# 1
# Contacts#contacts returns an empty array when no contacts added
iphone_list = Contacts.new
expect(iphone_list.contacts).to eq([])

# DIARYENTRY UNIT TESTS
# 1
# DiaryEntry#word_count returns the number of words in the entry as an integer
entry_1 = DiaryEntry.new('Title', 'one ' * 55)
expect(entry_1.word_count).to eq(55)

# 2
# DiaryEntry#reading_time raises error if wpm is <= 1
entry_1 = DiaryEntry.new('title','one ' * 150)
expect{ entry_1.reading_time(-4) }.to raise_error("wpm must be positive")

# 3
# DiaryEntry#reading_time returns 1 (minute) when given a 180 word entry and a reading speed of 200wpm" 
entry_1 = DiaryEntry.new('title','one ' * 180)
expect(entry_1.reading_time(200)).to eq(1)

# 4
# DiaryEntry#reading_time returns 5 (minutes) when given a 430 word entry and a reading speed of 100wpm"
diary_entry = DiaryEntry.new('title','one ' * 430)
expect(diary_entry.reading_time_int(100)).to eq(5)

# DIARY UNIT TESTS
# 1
# Diary#all raises error if called on an empty diary
my_diary = Diary.new
expect{ my_diary.all }.to raise_error('No entries to show')

# 2
# Diary#find_best_entry_for_reading_time raises errors if minutes <= 0, wpm <= 0
my_diary = Diary.new
expect{ my_diary.find_best_entry_for_reading_time(200, 0).to raise_error('You must have 1 or more minutes to read')
expect{ my_diary.find_best_entry_for_reading_time(-100, 12).to raise_error('WPM must be positive')

# 3 
# Diary#find_best_entry_for_reading_time raises errors if diary is empty
my_diary = Diary.new
expect{ my_diary.find_best_entry_for_reading_time(200, 10) }.to raise_error('Diary empty')
```
 
## 5. Implement the Behaviour
 
For each example you create as a test, implement the behaviour that allows the
class to behave according to your example.
 
Then return to step 3 until you have addressed the problem you were given. You
may also need to revise your design, for example if you realise you made a
mistake earlier.
