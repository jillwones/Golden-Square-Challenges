require 'music_tracker'

describe MusicTracker do 
  context 'when no artists or songs in library' do 
    it '#list_all fails' do 
      music_library = MusicTracker.new 
      expect{ music_library.list_all }.to raise_error('Empty music library')
    end
  end 

  context 'when one artist added' do 
    it '#list_all putses 1 artist and 1 song on same bullet point' do 
      music_library = MusicTracker.new 
      music_library.add('Aerosmith', 'Dream On')
      expected = ["Music Library:", "* Aerosmith: Dream On"].join("\n") + "\n"
      expect{ music_library.list_all }.to output(expected).to_stdout
    end

    it '#list_all putses 1 artist and 2 songs on same bullet point' do 
      music_library = MusicTracker.new 
      music_library.add('Aerosmith', 'Dream On')
      music_library.add('Aerosmith', 'Sweet Emotion')
      expected = ["Music Library:", "* Aerosmith: Dream On, Sweet Emotion"].join("\n") + "\n"
      expect{ music_library.list_all }.to output(expected).to_stdout
    end 
  end

  context 'when two artists added' do 
    it '#list_all putses artist on different bullet points' do 
      music_library = MusicTracker.new 
      music_library.add('Aerosmith', 'Dream On')
      music_library.add('Calvin Harris', 'Acceptable In the 80s')
      expected = ["Music Library:", "* Aerosmith: Dream On", "* Calvin Harris: Acceptable In the 80s"].join("\n") + "\n"
      expect{ music_library.list_all }.to output(expected).to_stdout
    end 

    it '#list_artist putses artist passed as argument' do 
      music_library = MusicTracker.new 
      music_library.add('Aerosmith', 'Dream On')
      music_library.add('Calvin Harris', 'Acceptable In the 80s')
      expected = ["Songs by Aerosmith:", "* Dream On"].join("\n") + "\n"
      expect{ music_library.list_artist('Aerosmith')}.to output(expected).to_stdout 
    end
  end 

  context 'when calling #list_artist with artist that is not in your library' do 
    it 'fails' do 
      music_library = MusicTracker.new 
      music_library.add('Aerosmith', 'Dream On')
      expect{ music_library.list_artist('Drake')}.to raise_error('No songs by this artist in your music library')
    end 
  end
  
end