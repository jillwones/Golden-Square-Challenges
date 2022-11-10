# integration
# adding instances of entries calling all returns an array their names
# count words should return the total number of words in all the contents of the diary entries
# reading time returns the estimate for the reading time for all diary entries (calling reading time for each)
# returns the diary entry that has the most words but still less than wpm*minutes

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
      it "returns time to read all entries contents" do 
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title1","one " * 150)
        diary_entry2 = DiaryEntry.new("title2","two " * 150)
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.reading_time(100)).to eq(3)
      end
    end
  end
end