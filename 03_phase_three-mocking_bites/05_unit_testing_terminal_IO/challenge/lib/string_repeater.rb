# frozen_string_literal: true

class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts 'Please enter a string'
    string = @terminal.gets.chomp
    @terminal.puts 'Please enter a number of repeats'
    number = get_number
    @terminal.puts 'Here is your result'
    @terminal.puts (string * number).to_s
  end

  private

  def get_number
    number = @terminal.gets.chomp
    return number.to_i if number.to_i.to_s == number

    raise 'must input a number'
  end
end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run
