require 'secret_diary'

describe SecretDiary do 
  describe '#secret_diary' do
    it 'initially is locked' do 
      diary = double(:diary)
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error("Go away!")
    end
    it 'fails when read is called and the diary has been locked' do 
      diary = double(:diary)
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock 
      expect{ secret_diary.read }.to raise_error("Go away!")
    end
    it 'returns the contents of the diary if diary is unlocked' do 
      diary = double(:diary) # or instead of line 19 could do double(:diary, read: 'stuff')
      allow(diary).to receive(:read).and_return('stuff')
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq('stuff')
    end
  end
end