require 'check_codeword'

describe 'check method check_codeword' do 
  it 'returns the wrong message when given the wrong codeword' do
    expect(check_codeword('fred')).to eq('WRONG!')
  end

  it 'returns close when passed "home"' do 
    expect(check_codeword('home')).to eq('Close, but nope.')
  end 

  it 'returns correct when passed "horse"' do 
    expect(check_codeword('horse')).to eq('Correct! Come in.')
  end
end