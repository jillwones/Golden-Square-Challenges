# frozen_string_literal: true

require 'string_repeater'

describe StringRepeater do
  it 'takes a string and repeats it' do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with('Please enter a string')
    expect(terminal).to receive(:gets).and_return('TWIX')
    expect(terminal).to receive(:puts).with('Please enter a number of repeats')
    expect(terminal).to receive(:gets).and_return('10')
    expect(terminal).to receive(:puts).and_return('Here is your result')
    expect(terminal).to receive(:puts).and_return('TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX')
    string_repeater = StringRepeater.new(terminal)
    string_repeater.run
  end

  it 'fails when num inputted isnt a num' do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with('Please enter a string')
    expect(terminal).to receive(:gets).and_return('TWIX')
    expect(terminal).to receive(:puts).with('Please enter a number of repeats')
    expect(terminal).to receive(:gets).and_return('not a number')
    string_repeater = StringRepeater.new(terminal)
    expect { string_repeater.run }.to raise_error('must input a number')
  end
end
