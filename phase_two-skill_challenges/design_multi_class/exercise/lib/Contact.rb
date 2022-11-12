class Contact
  attr_reader :name, :number
  
  def initialize(name, number)
    # name is a string
    # number is an 11 digit integer, raise error if not
  end
end