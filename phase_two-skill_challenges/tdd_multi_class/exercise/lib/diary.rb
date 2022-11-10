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

end