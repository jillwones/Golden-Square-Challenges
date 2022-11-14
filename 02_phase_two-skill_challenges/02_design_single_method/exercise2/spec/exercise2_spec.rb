require 'exercise2'

describe 'check_grammar method' do 
  context 'given arg thats not a string' do 
    it 'fails' do 
      expect { check_grammar(123)} .to raise_error "Not even a string."
    end 

    it 'fails' do 
      expect { check_grammar([123])}.to raise_error "Not even a string."
    end
  end

  context 'given an empty string' do 
    it 'fails' do 
      expect { check_grammar('') }.to raise_error "Not a sentence."
    end 
  end 

  context 'given a sentence with a capital letter and full stop' do
    it 'returns true' do 
      result = check_grammar("Hello, I'm Will.")
      expect(result).to eq(true)
    end
  end

  context 'given a sentence without a capital letter and full stop' do 
    it 'returns false' do 
      result = check_grammar("hello, I'm Will.")
      expect(result).to eq(false)
    end 
  end

  context 'given a sentence without a full stop' do 
    it 'returns false' do 
      result = check_grammar('Hello, how are you')
      expect(result).to eq(false)
    end 
  end

  context 'given a sentence without a full stop or capital' do 
    it 'returns false' do 
      result = check_grammar('hello, how are you')
      expect(result).to eq(false)
    end 
  end

  context 'given a sentence with a capital and exclamation point' do 
    it 'returns true' do 
      result = check_grammar('Hello!')
      expect(result).to eq(true)
    end 
  end

  context 'given a sentence with an uppercase first word and question mark' do 
    it 'returns true' do 
      result = check_grammar('WHAT?')
      expect(result).to eq(true)
    end 
  end

  context 'given a sentence with uppercase letter but ends in comma' do 
    it 'returns false' do 
      result = check_grammar('Hi, how are you,')
      expect(result).to eq(false)
    end
  end
end