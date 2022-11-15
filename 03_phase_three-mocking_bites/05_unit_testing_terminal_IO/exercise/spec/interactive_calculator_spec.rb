require 'interactive_calculator'

describe InteractiveCalculator do 
  it 'putses the result of the 2 numbers inputted via the terminal subtracted from one another' do 
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with('Please enter a number')
    expect(terminal).to receive(:gets).and_return('45')
    expect(terminal).to receive(:puts).with('Please enter another number')
    expect(terminal).to receive(:gets).and_return('19')
    expect(terminal).to receive(:puts).with('Here is your result')
    expect(terminal).to receive(:puts).with('45 - 19 = 26')
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run
  end
  it 'fails when inputs arent numbers' do 
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with('Please enter a number')
    expect(terminal).to receive(:gets).and_return('45')
    expect(terminal).to receive(:puts).with('Please enter another number')
    expect(terminal).to receive(:gets).and_return('bob')
    interactive_calculator = InteractiveCalculator.new(terminal)
    expect{ interactive_calculator.run }.to raise_error('You must enter a number')
  end
end