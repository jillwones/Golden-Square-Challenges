# frozen_string_literal: true

require 'music_library'
require 'track'

describe 'integration' do
  it 'adds and lists tracks' do
    music_library = MusicLibrary.new
    track_1 = Track.new('title1', 'artist1')
    track_2 = Track.new('title2', 'artist2')
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq([track_1, track_2])
  end
  it 'a list of tracks that match the keyword' do
    music_library = MusicLibrary.new
    track_1 = Track.new('title1', 'artist1')
    track_2 = Track.new('title2', 'artist2')
    track_3 = Track.new('hello', 'world')
    music_library.add(track_1)
    music_library.add(track_2)
    music_library.add(track_3)
    expect(music_library.search('title')).to eq([track_1, track_2])
  end
end
