# frozen_string_literal: true

class InteractiveCalculator
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts 'Please enter a number'
    number = get_number
    @terminal.puts 'Please enter another number'
    number_2 = get_number
    @terminal.puts 'Here is your result'
    @terminal.puts format_subtraction(number, number_2)
  end

  private

  def get_number
    response = @terminal.gets.chomp
    return response.to_i if response.to_i.to_s == response

    raise 'You must enter a number'
  end

  def format_subtraction(number_1, number_2)
    "#{number_1} - #{number_2} = #{number_1 - number_2}"
  end
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run
