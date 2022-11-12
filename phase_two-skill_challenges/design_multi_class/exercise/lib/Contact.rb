class Contact
  attr_reader :name, :number
  
  def initialize(name, number)
    raise 'Number must be an 11 digit integer' if !number.is_a? Integer or number.digits.length != 11
    # name is a string
    # number is an 11 digit integer, raise error if not
    @name = name
    @number = number
  end
end