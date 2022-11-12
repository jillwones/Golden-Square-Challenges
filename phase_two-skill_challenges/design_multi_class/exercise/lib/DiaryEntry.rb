# frozen_string_literal: true

class DiaryEntry
  attr_reader :title, :content

  def initialize(title, content)
    @title = title
    @content = content
  end

  def word_count
    @content.split(' ').count
  end

  def reading_time(wpm)
    raise 'wpm must be positive' unless wpm.positive?

    (word_count / wpm.to_f).ceil
  end
end
