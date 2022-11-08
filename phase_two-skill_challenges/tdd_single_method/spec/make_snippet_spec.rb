require 'make_snippet'

describe 'make_snippet' do
  context 'given an empty string' do 
    it 'returns an empty string' do 
      expect(make_snippet('')).to eq('')
    end 
  end
  context 'less than 6 words in input string' do
    it 'returns all of the words as they are' do 
      string = 'This is a string'
      expect(make_snippet(string)).to eq('This is a string')
    end 
  end
  context '6 or more words in input string' do 
    it 'returns the first 5 followed by ... ' do 
      string = 'This is quite a long string here'
      expect(make_snippet(string)).to eq('This is quite a long...')
    end
  end 
end