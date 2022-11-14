# frozen_string_literal: true

class Diary
  def initialize
    @diary = []
  end

  def add(entry)
    @diary << entry
  end

  def all
    @diary
  end

  def count_words
    sum = 0
    @diary.each do |entry|
      sum += entry.count_words
    end
    sum
  end

  def reading_time(wpm)
    raise 'wpm must be positive' unless wpm.positive?
    
    sum = 0
    @diary.each do |entry|
      sum += entry.reading_time_float(wpm)
    end
    sum.ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    raise 'Diary empty' if @diary.empty?
    raise 'wpm must be positive' unless wpm.positive?
    raise 'minutes must be positive' unless minutes.positive?

    reading_times_hash = {}
    @diary.each do |entry|
      reading_times_hash[entry] = entry.reading_time_int(wpm)
    end
    array_of_sorted_entry_reading_times = reading_times_hash.select { |_entry, time| time <= minutes }.sort_by { |_entry, time| time }.to_a
    raise('All entries are too long.') if array_of_sorted_entry_reading_times.empty?  
    array_of_sorted_entry_reading_times[-1][0]
  end
end
