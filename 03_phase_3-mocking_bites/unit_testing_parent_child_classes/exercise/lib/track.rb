# frozen_string_literal: true

class Track
  attr_reader :title, :artist

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword)
    @title.include? keyword or @artist.include? keyword
  end
end
