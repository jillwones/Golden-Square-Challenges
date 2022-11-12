# frozen_string_literal: true

require 'Diary'

describe Diary do
  describe '#all' do
    it 'fails when diary is empty' do
      my_diary = Diary.new
      expect { my_diary.all }.to raise_error('No entries to show')
    end
  end

  describe '#find_best_entry_for_reading_time' do
    it 'raises errors if minutes <= 0, wpm <= 0' do
      my_diary = Diary.new
      expect do
        my_diary.find_best_entry_for_reading_time(200, 0)
      end.to raise_error('You must have 1 or more minutes to read')
      expect { my_diary.find_best_entry_for_reading_time(-100, 12) }.to raise_error('WPM must be positive')
    end
    it 'raises errors if diary is empty' do
      my_diary = Diary.new
      expect { my_diary.find_best_entry_for_reading_time(200, 10) }.to raise_error('Diary is empty')
    end
  end
end
