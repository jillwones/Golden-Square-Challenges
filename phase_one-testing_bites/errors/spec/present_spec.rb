require 'present'

describe Present do 
  it 'wraps and unwraps a value' do 
    present = Present.new 
    present.wrap(6)
    expect(present.unwrap).to eq(6)
  end
  context 'when unwrapping a present that was never wrapped' do
    it 'fails' do 
      toy = Present.new
      expect { toy.unwrap }.to raise_error "No contents have been wrapped."
    end 
  end
  context 'wrapping an already wrapped present' do 
    it 'fails' do
      present = Present.new 
      present.wrap('toy') 
      expect { present.wrap('another toy') }.to raise_error "A contents has already been wrapped."
      expect(present.unwrap).to eq('toy')
    end
  end 
end