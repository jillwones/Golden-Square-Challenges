class GrammarStats
  def initialize
    @trues = 0
    @falses = 0
  end 

  def check(text)
    raise 'Not a sentence.' if text.empty?
    if bool = text[0].upcase == text[0] and text[-1] =~ /[.?!]/ 
      @trues += 1
      true 
    else 
      @falses += 1
      false 
    end
  end

  def percentage_good
    total_checked = @trues + @falses
    raise 'No text checked yet.' if total_checked.zero?
    (@trues / total_checked.to_f) * 100
  end
end 


# Layout for class provided:

=begin 

class GrammarStats
  def initialize
    # ...
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end

=end 