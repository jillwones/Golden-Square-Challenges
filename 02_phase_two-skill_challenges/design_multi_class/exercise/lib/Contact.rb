# frozen_string_literal: true

class Contact
  attr_reader :name, :number

  def initialize(name, number)
    raise 'Number must be an 11 digit integer' if !number.is_a?(Integer) || (number.digits.length != 11)

    @name = name
    @number = number
  end
end
