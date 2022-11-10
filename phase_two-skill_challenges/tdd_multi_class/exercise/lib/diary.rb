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

  def reading_time wpm 
    sum = 0
    @diary.each do |entry|
      sum += entry.reading_time_float(wpm)
    end 
    sum.ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    raise "Diary empty" if @diary.empty?
    reading_times_hash = Hash.new
    @diary.each do |entry|
      reading_times_hash[entry] = entry.reading_time_int(wpm)
    end
    reading_times_hash.select{|entry,time| time <= minutes}.sort_by{|entry,time| time}.to_a[0][0]
  end
end