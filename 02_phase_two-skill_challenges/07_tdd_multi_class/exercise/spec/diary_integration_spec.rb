# integration tests

# adding instances of entries calling all returns an array their names
# #count_words should return the total number of words in all the contents of the diary entries
# #reading_time returns the estimate for the reading time for all diary entries (calling reading time for each)
# #find_best_entry_for_reading_time should return the longest diary entry the user can read considering the wpm and minutes available

require 'diary'
require 'diary_entry'

describe "diary and diary_entry integration" do
  context "when multiple entries are added" do
    describe '#all behaviour' do 
      it "returns all entries" do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","contents1")
        diary_entry2 = DiaryEntry.new("title2","contents2")
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.all).to eq [diary_entry1,diary_entry2]
      end
    end
    describe '#count_words behaviour' do 
      it 'returns total num of words for all entries' do 
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 150)
        diary_entry2 = DiaryEntry.new("title2","two " * 150)
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.count_words).to eq(300)
      end
    end

    describe '#reading_time behaviour' do
      it 'fails when wpm <= 0' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 100)
        diary.add(diary_entry1)
        expect{ diary.find_best_entry_for_reading_time(0,2) }.to raise_error('wpm must be positive')
      end
      it "returns time to read all entries contents" do 
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 150)
        diary_entry2 = DiaryEntry.new("title2","two " * 150)
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.reading_time(100)).to eq(3)
      end
    end

    describe '#find_best_entry_for_reading_time' do 
      it 'fails when wpm or minutes is <= 0' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 100)
        diary.add(diary_entry1)
        expect{ diary.find_best_entry_for_reading_time(0,2) }.to raise_error('wpm must be positive')
        expect{ diary.find_best_entry_for_reading_time(200,-7) }.to raise_error('minutes must be positive')
      end
      it 'returns the entry in the diary if only 1 entry present' do 
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 100)
        diary.add(diary_entry1)
        expect(diary.find_best_entry_for_reading_time(100,2)).to eq(diary_entry1)
      end
      it 'returns error if 1 entry present but not readable in amount of time' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 100)
        diary.add(diary_entry1)
        expect{ diary.find_best_entry_for_reading_time(5,2) }.to raise_error('All entries are too long.')
      end
      it 'returns the entry if it has got the exact amount of words they can read in the given time' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 100)
        diary_entry2 = DiaryEntry.new("title2","two " * 200)
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.find_best_entry_for_reading_time(100,2)).to eq(diary_entry2)
      end
      it 'returns the entry if it has got less than the amount of words they can read in the given time but its the closest' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 100)
        diary_entry2 = DiaryEntry.new("title2","two " * 200)
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.find_best_entry_for_reading_time(99,2)).to eq(diary_entry1)
      end
    end
  end
end