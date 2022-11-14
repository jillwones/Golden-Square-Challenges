def calculate_reading_time(text)
  array = text.split(' ')
  time = (array.length / 200.to_f).ceil
  "#{time} #{time == 1 ? 'minute' : 'minutes'}"
end
