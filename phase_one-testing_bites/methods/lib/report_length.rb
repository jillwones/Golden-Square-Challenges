def report_length(str)
  raise ArgumentError.new(
    "Expected argument to be a string"
  ) if !str.is_a? String
  length = str.length
  return "This string was #{length} characters long."
end