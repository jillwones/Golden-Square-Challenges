# frozen_string_literal: true

require 'music_library'

describe MusicLibrary do
  it 'adds an instance of track to the music library' do
    music_library = MusicLibrary.new
    track_1 = double(:track)
    track_2 = double(:track)
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq([track_1, track_2])
  end
  it 'a list of tracks that match the keyword' do
    music_library = MusicLibrary.new
    track_1 = double(:track, matches?: true)
    track_2 = double(:track, matches?: false)
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search('keyword')).to eq([track_1])
  end
end
