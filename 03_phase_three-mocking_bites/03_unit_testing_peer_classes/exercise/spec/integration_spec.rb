# frozen_string_literal: true

require 'secret_diary'
require 'diary'

describe 'integration' do
  describe '#secret_diary' do
    it 'initially is locked' do
      diary = Diary.new('stuff')
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error('Go away!')
    end
    it 'fails when read is called and the diary has been locked' do
      diary = Diary.new('contents')
      secret_diary = SecretDiary.new(diary)
      secret_diary.lock
      expect { secret_diary.read }.to raise_error('Go away!')
    end
    it 'returns the contents of the diary if diary is unlocked' do
      diary = Diary.new('contents')
      secret_diary = SecretDiary.new(diary)
      secret_diary.lock
      secret_diary.unlock
      expect(secret_diary.read).to eq('contents')
    end
  end
end
