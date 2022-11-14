# Unit Testing peer Classes

Learn to unit test peer classes.

## Introduction

A peer relationship between classes is one where a class is associated with
another class one-to-one.

The principle of unit testing peer classes is very similar to testing
parent-child classes. Consider this example:

```ruby
# File: lib/diary_entry.rb

class DiaryEntry
  def initialize(title, contents) # title, contents are both strings
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end
end
```

```ruby
# File: lib/diary_entry_formatter.rb

class DiaryEntryFormatter
  def initialize(diary_entry) # diary_entry is an instance of DiaryEntry

  end

  def format
    # Returns a nicely formatted diary entry
  end
end
```

In this case, instead of creating a mock and passing it into a method, we pass
it into the initializer.

```ruby
# File: spec/diary_entry_formatter_spec.rb

RSpec.describe DiaryEntryFormatter do
  it "formats a diary entry" do
    fake_diary_entry = double(:fake_diary_entry, title: "Hello", contents: "Hello, world!")
    formatter = DiaryEntryFormatter.new(fake_diary_entry)
    expect(formatter.format).to eq "Hello: Hello, world!"
  end
end
```
