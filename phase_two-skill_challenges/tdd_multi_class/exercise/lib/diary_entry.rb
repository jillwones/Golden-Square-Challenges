class DiaryEntry
  def initialize(title,contents)
    @title = title
    @contents = contents
  end

  def count_words 
    @contents.split(' ').count
  end

  def reading_time_float(wpm) 
    (count_words / wpm.to_f) 
  end

  def reading_time_int(wpm) 
    (count_words / wpm.to_f).ceil 
  end

end