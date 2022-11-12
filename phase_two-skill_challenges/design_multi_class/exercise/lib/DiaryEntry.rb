# frozen_string_literal: true

class DiaryEntry
  attr_reader :title, :content # to access the title and contents of a given entry

  def initialize(title, content)
    # initialises title and content, both are strings
    @title = title
    @content = content
  end

  def word_count
    # calculates the num of words in the entry
    # returns num of words as an integer
    # i suppose can be a private method
    @content.split(' ').count
  end

  def reading_time(wpm)
    raise 'wpm must be positive' unless wpm.positive?

    (word_count / wpm.to_f).ceil
    # wpm is an integer, words per minute
    # calls on word_count to calculate reading time for the entry this method is called on
    # returns an integer that will give an estimate for reading time in minutes
  end
end
