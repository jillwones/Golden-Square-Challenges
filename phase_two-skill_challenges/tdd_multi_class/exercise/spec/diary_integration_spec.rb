# integration
# adding instances of entries calling all returns an array their names
# count words should return the total number of words in all the contents of the diary entries
# reading time returns the estimate for the reading time for all diary entries (calling reading time for each)
# returns the diary entry that has the most words but still less than wpm*minutes

require 'diary'
require 'diary_entry'

describe "diary and diary_entry integration" do
  context "when multiple entries are added" do
    it "returns all entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1","contents1")
      diary_entry2 = DiaryEntry.new("title2","contents2")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.all).to eq [diary_entry1,diary_entry2]
    end
  end







end