require 'grammar_stats'

describe GrammarStats do 
  describe '#check' do 
    context 'when given an empty string' do 
      it 'fails' do 
        grammar_checker = GrammarStats.new 
        expect{ grammar_checker.check('')}.to raise_error('Not a sentence.')
      end 
    end 

    context 'when given text with capital letter and valid ending punctuation' do 
      it 'returns true' do 
        grammar_checker = GrammarStats.new 
        expect(grammar_checker.check('Hello.')).to eq(true)
      end 
      it 'returns true' do 
        grammar_checker = GrammarStats.new 
        expect(grammar_checker.check('Why?')).to eq(true)
      end
    end 

    context 'when given text without capital and/ or invalid sentence ending punctuation' do 
      it 'returns false' do 
        grammar_checker = GrammarStats.new 
        expect(grammar_checker.check('who,')).to eq(false)
      end 
      it 'returns false' do 
        grammar_checker = GrammarStats.new 
        expect(grammar_checker.check('Why')).to eq(false)
      end
    end
  end 

  describe '#percentage_good' do 
    context 'when no text checked yet' do 
      it 'fails' do 
        grammar_checker = GrammarStats.new 
        expect{ grammar_checker.percentage_good }.to raise_error 'No text checked yet.'
      end 
    end 

    context 'when just trues' do 
      it 'returns 100' do
        grammar_checker = GrammarStats.new 
        grammar_checker.check('Hello.')
        expect(grammar_checker.percentage_good).to eq(100)
      end 

      it 'returns 100' do 
        grammar_checker = GrammarStats.new 
        grammar_checker.check('Hello.')
        grammar_checker.check('Why?')
        expect(grammar_checker.percentage_good).to eq(100)
      end
    end

    context 'when just falses' do 
      it 'returns 0' do 
        grammar_checker = GrammarStats.new 
        grammar_checker.check('Hello')
        grammar_checker.check('why?')
        expect(grammar_checker.percentage_good).to eq(0)
      end 
    end

    context 'when mixture of true and false' do
      it 'returns 50 when 1 true and 1 false' do 
        grammar_checker = GrammarStats.new 
        grammar_checker.check('Hello')
        grammar_checker.check('Why?')
        expect(grammar_checker.percentage_good).to eq(50)
      end 
      it 'returns 75 when 3 trues and 1 false' do 
        grammar_checker = GrammarStats.new 
        grammar_checker.check('Hello')
        grammar_checker.check('Why?')
        grammar_checker.check('Hello, how are you?')
        grammar_checker.check('I am Will.')
        expect(grammar_checker.percentage_good).to eq(75)
      end
    end
  end
end