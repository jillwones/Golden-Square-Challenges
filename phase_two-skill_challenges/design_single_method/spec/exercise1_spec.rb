require 'exercise1'

describe '#calculate_reading_time' do 
  
  context 'plural minutes' do
    it 'returns 0 minutes when passed empty string' do
      expect(calculate_reading_time('')).to eq('0 minutes')
    end 

    it 'returns 2 minutes when passed 300 words' do 
      expect(calculate_reading_time('one ' * 300)).to eq('2 minutes')
    end

    it 'returns 25 minutes when passed 5000 words' do 
      expect(calculate_reading_time('one ' * 5000)).to eq('25 minutes')
    end
  end 
  
  context 'given a string under 201 words - singular form of minute' do 
    it 'returns 1 minute' do 
      expect(calculate_reading_time('one')).to eq('1 minute')
    end 

    it 'returns 1 minute' do 
      expect(calculate_reading_time('one ' * 200)).to eq('1 minute')
    end
  end 
end