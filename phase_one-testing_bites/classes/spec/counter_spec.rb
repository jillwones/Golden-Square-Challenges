require 'counter'

describe Counter do 
  it 'initially reports a count of 0' do 
    counter = Counter.new
    expect(counter.report).to eq('Counted to 0 so far.')
  end
  it 'counts up to a certain number' do
    count = Counter.new 
    count.add(10)
    result = count.report
    expect(result).to eq('Counted to 10 so far.')
  end 
  it 'counts up to more than 1 number' do 
    count = Counter.new 
    count.add(5)
    count.add(11)
    count.add(2)
    expect(count.report).to eq('Counted to 18 so far.')
  end
end