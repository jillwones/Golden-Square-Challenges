# diary_entry_spec
# when initialized it creates an instance of diary entry with title and contents
# when title is called on the instance it returns the titlewhen title is called on contents it returns the contents
# count words splits entry contents into array of words and counts them
# reading time takes wpm and returns reading time of this instance of diary entry
# reading time throws erro if given parameter <= 0
# reading chunk wpm <= 0 causes a fail
# when given a text readable within minutes it returns full text
# text not readable within given minutes it just returns words readable within time
# next time its called it returns the next chunk
# it restarts after ending (either exactly on the end or if you could read beyond in given time)

require 'diary_entry'

describe DiaryEntry do
  context "when initialised expect to be an instance of DiaryEntry" do
    it "" do
      diary_entry = DiaryEntry.new('title','contents')
      expect(diary_entry).to be_an_instance_of DiaryEntry
    end
  end
end