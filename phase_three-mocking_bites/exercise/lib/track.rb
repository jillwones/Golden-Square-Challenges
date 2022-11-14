class Track
  attr_reader :title, :artist
  def initialize(title, artist) 
    # title and artist are both strings
    @title = title 
    @artist = artist
  end

  def matches?(keyword) 
    # keyword is a string
    # Returns true if the keyword matches either the title or artist
    @title.include? keyword or @artist.include? keyword
  end
end