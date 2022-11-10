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
  end

end