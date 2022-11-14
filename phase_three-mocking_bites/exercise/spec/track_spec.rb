require 'track'

describe Track do 
  context 'when initialised' do 
    it 'creates an instance of track' do 
      track = Track.new('title', 'artist')
      expect(track).to be_an_instance_of(Track)
    end
  end

  describe '#title' do 
    it 'returns the title of the track' do 
      track = Track.new('title', 'artist')
      expect(track.title).to eq('title')
    end
  end

  describe '#artist' do 
    it 'returns the artist of the track' do 
      track = Track.new('title', 'artist')
      expect(track.artist).to eq('artist')
    end
  end

  describe '#matches?' do 
    context 'when keyword matches either the title or artist' do 
      it 'returns true' do 
        track = Track.new('title', 'artist')
        expect(track.matches?('titl')).to eq(true)
      end
    end

    context 'when keyword doesnt match either the title or artist' do 
      it 'returns false' do 
        track = Track.new('title', 'artist')
        expect(track.matches?('hello')).to eq(false)
      end
    end
  end
end