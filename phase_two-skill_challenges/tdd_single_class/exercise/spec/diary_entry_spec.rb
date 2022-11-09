require 'diary_entry'

describe DiaryEntry do 
  it 'returns title' do 
    entry = DiaryEntry.new('Title', 'Contents')
    expect(entry.title).to eq('Title')
  end 

  it 'returns contents of the diary entry' do 
    entry = DiaryEntry.new('Title', 'Contents')
    expect(entry.contents).to eq('Contents')
  end

  describe '#count_words' do 
    it 'returns the number of words in the entry' do 
      entry = DiaryEntry.new('Title', 'one ' * 30)
      expect(entry.count_words).to eq(30)
    end
  end

  describe '#reading_time' do 
    context 'given a wpm of a sensible num (200)' do 
      it 'returns the celing of the number of minutes it takes to read the contents' do 
        entry = DiaryEntry.new('Title', 'one ' * 550)
        expect(entry.reading_time(200)).to eq(3)
      end 
    end 

    context 'given a wpm of 0 or minus' do 
      it 'fails' do 
        entry = DiaryEntry.new('Title', 'one' * 550)
        expect { entry.reading_time(0) }.to raise_error('Reading speed must be above 0.')
      end 
      it 'fails' do 
        entry = DiaryEntry.new('Title', 'one' * 550)
        expect { entry.reading_time(-7) }.to raise_error('Reading speed must be above 0.')
      end 
    end
  end

  describe '#reading_chunk' do 

    context 'given a wpm of 0 or minus' do 
      it 'fails' do 
        entry = DiaryEntry.new('Title', 'one' * 550)
        expect { entry.reading_chunk(0, 200) }.to raise_error('Reading speed must be above 0.')
        expect { entry.reading_chunk(-5, 200) }.to raise_error('Reading speed must be above 0.')
      end 
      it 'fails' do 
        entry = DiaryEntry.new('Title', 'one' * 550)
        expect { entry.reading_time(-7) }.to raise_error('Reading speed must be above 0.')
      end 
    end
    
    context 'with a text readible within given mins' do 
      it 'returns the full text' do 
        entry = DiaryEntry.new('Title', 'one two three')
        chunk = entry.reading_chunk(200, 1)
        expect(chunk).to eq('one two three')
      end 
    end 

    context 'with a text not readable within given mins' do 
      it 'returns all the words readable in that time' do 
        entry = DiaryEntry.new('Title', 'one two three')
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq('one two')
      end

      it 'returns next chunk next time its called' do 
        entry = DiaryEntry.new('Title', 'one two three')
        entry.reading_chunk(2, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq('three')
      end

      it 'returns next chunk next time its called' do 
        entry = DiaryEntry.new('Title', 'one two three four')
        entry.reading_chunk(2, 1)
        entry.reading_chunk(1, 1)
        chunk = entry.reading_chunk(1, 1)
        expect(chunk).to eq('four')
      end

      it 'restarts after reading whole contents' do 
        entry = DiaryEntry.new('Title', 'one two three')
        entry.reading_chunk(2, 1) # one two
        entry.reading_chunk(2, 1) # three
        chunk = entry.reading_chunk(2, 1) # one two
        expect(chunk).to eq('one two')
      end

      it 'restarts after ending exactly on the end' do 
        entry = DiaryEntry.new('Title', 'one two three')
        entry.reading_chunk(2, 1)
        entry.reading_chunk(1, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq('one two')
      end
    end
  end
end