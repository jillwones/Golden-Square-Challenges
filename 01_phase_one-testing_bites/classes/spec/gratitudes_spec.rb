require 'gratitudes'

describe Gratitudes do 
  context 'initially' do 
    it 'returns nothing to be grateful for' do 
      gratitudes = Gratitudes.new 
      expect(gratitudes.format).to eq('Be grateful for: ')
    end 
  end 
  context 'when 1 added' do 
    it 'returns 1 thing to be grateful for when 1 added' do 
      gratitudes = Gratitudes.new 
      gratitudes.add('Makers')
      expect(gratitudes.format).to eq('Be grateful for: Makers')
    end 
  end
  context 'when multiple added' do 
    it 'returns multiple gratitudes all comma spaced' do 
      gratitudes = Gratitudes.new 
      gratitudes.add('Makers')
      gratitudes.add('Dogs')
      gratitudes.add('Sunshine')
      expect(gratitudes.format).to eq('Be grateful for: Makers, Dogs, Sunshine')
    end 
  end
end