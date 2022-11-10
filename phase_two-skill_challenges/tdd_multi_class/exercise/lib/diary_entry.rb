class DiaryEntry
  attr_reader(:title, :contents)

  def initialize(title, contents)
    @title = title
    @contents = contents
    @last_read_word = 0
  end

  def count_words
    @contents.split(' ').count
  end

  def reading_time_int(wpm)
    raise 'wpm must be positive' if wpm <= 0

    (count_words / wpm.to_f).ceil
  end

  def reading_time_float(wpm)
    (count_words / wpm.to_f)
  end

  def reading_chunk(wpm, minutes)
    raise 'wpm must be positive' unless wpm.positive?
    raise 'minutes must be positive' unless minutes.positive?
    total_words = wpm * minutes 
    start_from = @last_read_word
    end_at = @last_read_word + total_words
    chunk_array = words[start_from, end_at]
    if end_at >= words.length
      @last_read_word = 0 
    else 
      @last_read_word = end_at
    end
    chunk_array.join(' ')
  end

  private
  def words
    @contents.split(' ')
  end
end
