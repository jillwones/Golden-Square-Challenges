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