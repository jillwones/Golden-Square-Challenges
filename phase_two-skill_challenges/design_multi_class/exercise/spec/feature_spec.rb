require 'Contact'
require 'ContactsList'
require 'Diary'
require 'DiaryEntry'
require 'Todo'
require 'TodoList'

describe TodoList do 
  describe '#list_all' do
    it 'putses all todos in the list' do 
      todo_list = TodoList.new
      todo_1 = Todo.new('Walk the dog')
      todo_2 = Todo.new('Clean house')
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expected = ["All TODOS:", "* Walk the dog", "* Clean house"].join("\n") + "\n"
      expect{ todo_list.list_all }.to output(expected).to_stdout
    end
  end

  describe '#mark_done' do 
    it 'removes the todo in arg' do 
      todo_list = TodoList.new
      todo_1 = Todo.new('Walk the dog')
      todo_2 = Todo.new('Clean house')
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.mark_done(todo_1)
      expected = ["All TODOS:", "* Clean house"].join("\n") + "\n"
      expect{ todo_list.list_all }.to output(expected).to_stdout
    end

    it 'fails when arg is not a todo in the list' do 
      todo_list = TodoList.new 
      todo_1 = Todo.new('Something')
      expect{ todo_list.mark_done(todo_1) }.to raise_error('Todo not on the list')
    end
  end
end

describe Contacts do 
  describe '#contacts' do 
    it 'returns an array of contacts' do 
      iphone = Contacts.new
      contact_1 = Contact.new('Bob', 37462836421)
      contact_2 = Contact.new('Jill', 47582937182)
      iphone.add(contact_1)
      iphone.add(contact_2)
      expect(iphone.contacts).to eq([contact_1, contact_2])
    end
  end
end

describe Diary do 
  describe '#all' do 
    it 'returns all entries in the diary' do 
      diary = Diary.new
      entry_1 = DiaryEntry.new('Title', 'Contents')
      entry_2 = DiaryEntry.new('Title 2', 'Contents 2')
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq([entry_1, entry_2])
    end
  end

  describe '#find_best_entry_for_reading_time' do 
    it 'returns the entry if it has got the exact amount of words they can read in the given time' do 
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1","one " * 100)
      diary_entry2 = DiaryEntry.new("title2","two " * 200)
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.find_best_entry_for_reading_time(100,2)).to eq(diary_entry2)
    end
    it 'eturns the entry if it has got less than the amount of words they can read in the given time but is the closest' do 
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1","one " * 100)
      diary_entry2 = DiaryEntry.new("title2","two " * 200)
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.find_best_entry_for_reading_time(99,2)).to eq(diary_entry1)
    end
    it 'fails if entries present not readable with given wpm and minutes' do 
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1","one " * 1000)
      diary.add(diary_entry1)
      expect{ diary.find_best_entry_for_reading_time(200,1) }.to raise_error('All entries are too long.')
    end
  end
  
  describe '#check_diary_for_phone_numbers' do 
    it 'returns all of the entries that contain numbers found in a certain contacts list' do 
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
      expected = "title1 - Bob - 46372364831, title3 - Jill - 36473920463"
      expect(my_diary.check_diary_for_phone_numbers(iphone_list)).to eq(expected)
    end

    it 'returns "No contacts found in diary" if none found' do 
      my_diary = Diary.new
      entry1 = DiaryEntry.new("title1", "random words more random words")
      entry2 = DiaryEntry.new("title2", "no number in this one")
      entry3 = DiaryEntry.new("title3", "random words more random")
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
      expect(my_diary.check_diary_for_phone_numbers(iphone_list)).to eq('No contacts found in diary')
    end
  end
end