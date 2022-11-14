# diary_spec

# when initialised it should create an empty array
# check that showing all on empty diary show empty array
# reading time for an empty diary should return 0
# find best entry for empty diary should throw error

require 'diary'

describe Diary do
  context "when no entries present" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
    it "returns 0 reading time" do
      diary = Diary.new
      expect(diary.reading_time(100)).to eq 0
    end
    it 'returns 0 counted words' do 
      diary = Diary.new 
      expect(diary.count_words).to eq(0)
    end
    it "throws an error when #find_best_entry_for_reading_time is called on an empty diary" do
      diary = Diary.new
      expect{ diary.find_best_entry_for_reading_time(100,5) }.to raise_error "Diary empty"
    end
  end
end