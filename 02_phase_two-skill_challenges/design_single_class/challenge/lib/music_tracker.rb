class MusicTracker
  def initialize
    @music_library = {}
  end 

  def add(artist, song)
    @music_library[artist] = [] if @music_library[artist].nil?
    @music_library[artist] << song
  end

  def list_all
    raise 'Empty music library' if @music_library.empty?

    puts "Music Library:"
    @music_library.each do |k, v|
      puts "* #{k}: #{v.join(', ')}"
    end
  end

  def list_artist(artist)
    raise "No songs by this artist in your music library" if @music_library[artist].nil?
    puts "Songs by #{artist}:"
    @music_library.each do |k, v|
      if k == artist 
        puts "* #{v.join(', ')}"
      end 
    end
  end
end