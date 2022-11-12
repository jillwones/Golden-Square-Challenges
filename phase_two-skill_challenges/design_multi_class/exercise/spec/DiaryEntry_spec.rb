require 'DiaryEntry'

describe DiaryEntry do 
  describe '#word_count' do 
    it 'returns the number of words in an entry as an integer' do 
      entry_1 = DiaryEntry.new('Title', 'one ' * 55)
      expect(entry_1.word_count).to eq(55)
    end
  end

  describe '#reading_time' do 
    it 'fails when passed wpm <= 0' do 
      entry_1 = DiaryEntry.new('title','one ' * 150)
      expect{ entry_1.reading_time(-4) }.to raise_error("wpm must be positive")
    end
    it 'returns 1 (minute) when given a 180 word entry and a reading speed of 200wpm' do 
      entry_1 = DiaryEntry.new('title','one ' * 180)
      expect(entry_1.reading_time(200)).to eq(1)
    end
    it 'returns 5 (minutes) when given a 430 word entry and a reading speed of 100wpm' do 
      diary_entry = DiaryEntry.new('title','one ' * 430)
      expect(diary_entry.reading_time(100)).to eq(5)
    end
  end
end