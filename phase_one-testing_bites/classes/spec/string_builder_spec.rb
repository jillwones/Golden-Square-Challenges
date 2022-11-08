require 'string_builder'

describe StringBuilder do 
  it 'initially returns an empty string' do 
    string = StringBuilder.new 
    expect(string.output).to eq('')
  end

  it 'initially returns a length of 0' do 
    string = StringBuilder.new 
    expect(string.size).to eq(0)
  end

  context 'given one added string' do
    it 'outputs that string' do 
      string = StringBuilder.new
      string.add('hello')
      expect(string.output).to eq('hello')
    end 

    it 'outputs the size of that string' do 
      string = StringBuilder.new 
      string.add('hello')
      expect(string.size).to eq(5)
    end
  end

  context 'given multiple strings' do
    it 'builds up a string at returns the length of that string' do 
      string = StringBuilder.new
      string.add('hello')
      string.add('world')
      result = string.size 
      expect(result).to eq(10)
    end 
  end
end