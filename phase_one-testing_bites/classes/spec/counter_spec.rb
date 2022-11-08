require 'counter'

describe Counter do 
  it 'counts up to a certain number' do
    count = Counter.new 
    count.add(10)
    result = count.report
    expect(result).to eq('Counted to 10 so far.')
  end 
end