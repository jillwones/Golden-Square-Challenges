# diary_entry_spec:

# when initialized it creates an instance of diary entry with title and contents
# when title is called on the instance it returns the title when title is called on contents it returns the contents
# count words splits entry contents into array of words and counts them
# reading time takes wpm and returns reading time of this instance of diary entry
# reading time throws error if given parameter <= 0
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
  context "attributes called" do
    it "returns title when title" do
      diary_entry = DiaryEntry.new('title','contents')
      expect(diary_entry.title).to eq 'title'
    end
    it "returns contents when contents" do
      diary_entry = DiaryEntry.new('title','contents')
      expect(diary_entry.contents).to eq 'contents'
    end
  end
  describe "#count_words" do
    it "it should return 3 when content of diary entry is 3 words" do
      diary_entry = DiaryEntry.new('title','one two three')
      expect(diary_entry.count_words).to eq 3
    end
    it "it should return 500 when content of diary entry is 500 words" do
      diary_entry = DiaryEntry.new('title','one ' * 500)
      expect(diary_entry.count_words).to eq 500
    end
  end
  describe "#reading_time" do 
    it "it returns 1 (minute) when given a 150 word entry and a reading speed of 200wpm" do
      diary_entry = DiaryEntry.new('title','one ' * 150)
      expect(diary_entry.reading_time_int(200)).to eq 1
    end
    it "it returns 5 (minute) when given a 450 word entry and a reading speed of 100wpm" do
      diary_entry = DiaryEntry.new('title','one ' * 450)
      expect(diary_entry.reading_time_int(100)).to eq 5
    end
    it "it raises error if wpm <= 0" do
      diary_entry = DiaryEntry.new('title','one ' * 150)
      expect{ diary_entry.reading_time_int(-4) }.to raise_error "wpm must be positive"
    end
  end
  describe "reading_chunk method" do
    it "raises error if wpm <= 0 or minutes <= 0" do
      diary_entry = DiaryEntry.new('title','one two three')
      expect{ diary_entry.reading_chunk(-4,5) }.to raise_error "wpm must be positive"
      expect{ diary_entry.reading_chunk(4,-5) }.to raise_error "minutes must be positive"
    end
    it  "returns full text if given enough time" do
      diary_entry = DiaryEntry.new('title','one two three')
      expect(diary_entry.reading_chunk(1,5)).to eq 'one two three'
    end
    it  "returns readable text in given time" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      expect(diary_entry.reading_chunk(1,3)).to eq 'one two three'
    end
    it  "the next chunk when previously not finished" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      diary_entry.reading_chunk(1,3)
      expect(diary_entry.reading_chunk(1,2)).to eq 'four five'
    end
    it  "restarts after finishing reading the full text exactly" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      diary_entry.reading_chunk(1,5)
      expect(diary_entry.reading_chunk(1,2)).to eq 'one two'
    end
    it  "restarts after finishing reading the full text" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      diary_entry.reading_chunk(2,5)
      expect(diary_entry.reading_chunk(1,2)).to eq 'one two'
    end
  end
end
