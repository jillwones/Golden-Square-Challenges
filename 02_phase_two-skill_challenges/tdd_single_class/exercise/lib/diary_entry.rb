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

# Layout for class provided:

=begin 

class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) 
    # wpm is an integer representing the number of words the
    # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) 
    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end

=end 
