require 'count_words'

describe 'count_words method' do 
  it 'returns 0 when passed an empty string' do 
    expect(count_words('')).to eq(0)
  end 

  it 'returns 4 when passed "hello how are you' do 
    string = 'hello how are you?'
    expect(count_words(string)).to eq(4)
  end
end