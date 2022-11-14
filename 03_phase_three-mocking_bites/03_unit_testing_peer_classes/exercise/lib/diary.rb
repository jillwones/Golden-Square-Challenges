class Diary
  def initialize(contents)
    raise 'Argument must be a string' unless contents.is_a?(String)
    @contents = contents
  end

  def read
    @contents
  end
end