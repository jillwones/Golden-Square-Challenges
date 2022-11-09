class DiaryEntry
  def initialize(title, contents)
    @title = title 
    @contents = contents 
    @last_read_word = 0
  end 

  def title
    @title 
  end

  def contents 
    @contents 
  end

  def count_words
    @contents.split(' ').length
  end

  def reading_time(wpm)
    raise 'Reading speed must be above 0.' if wpm < 1
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    # wpm words per minute user can read
    # minutes is how many minutes they have to read
    raise 'Reading speed must be above 0.' if wpm < 1
    total_words = wpm * minutes 
    start_from = @last_read_word
    end_at = @last_read_word + total_words
    chunk_array = words[start_from, end_at]
    if end_at >= words.length
      @last_read_word = 0 
    else 
      @last_read_word = end_at
    end
    chunk_string = chunk_array.join(' ')
  end

  private 

  def words 
    @contents.split(' ')
  end 

end