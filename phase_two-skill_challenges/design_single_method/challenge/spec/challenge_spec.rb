require 'challenge'

describe '#todo_checker' do 
  context 'arg is not a string' do 
    it 'fails with int arg' do 
      expect { todo_checker(123) }.to raise_error 'Not a string.'
    end 

    it 'fails with array arg' do 
      expect { todo_checker([123])}.to raise_error 'Not a string.'
    end
  end 

  context 'arg is an empty string' do 
    it 'fails' do 
      expect { todo_checker('')}.to raise_error 'Not a sentence.'
    end 
  end

  context 'text doesnt include #TODO' do 
    it 'returns false' do 
      result = todo_checker('eat chocolate')
      expect(result).to eq(false)
    end 
  end

  context 'text includes #TODO' do
    it 'returns true' do 
      result = todo_checker('#TODO eat chocolate')
      expect(result).to eq(true)
    end 
  end

  context 'text includes #TODO at the end' do 
    it 'returns true' do 
      result = todo_checker('eat chocolate#TODO')
      expect(result).to eq(true)
    end 
  end

  context 'text includes todo but no other words' do 
    it 'returns false' do 
      result = todo_checker('#TODO')
      expect(result).to eq(false)
    end 
  end
end