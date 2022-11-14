# Unit Testing Parent-Child Classes
A parent-child relationship between classes is one where there is a single class
that looks after a list of other classes. For example, a `Diary` having many
`Entries`.

(taken from the Golden Square repo) Consider the following design:

```ruby
class Diary
  def add(entry) # entry is an instance of DiaryEntry
  end

  def entries
    # Returns a list of DiaryEntries
  end

  def count_words
    # Returns the number of words in all entries
  end
end

class DiaryEntry
  def initialize(title, contents) # title, contents are both strings
  end

  def title
    # Returns title as a string
  end

  def contents
    # Returns contents as a string
  end

  def count_words
    # Returns the number of words in the contents
  end
end
```

And let's suppose we wanted to integration test the word counting behaviour.

```ruby
require "diary"
require "diary_entry"

RSpec.describe "integration" do
  it "counts the words in all entries" do
    diary = Diary.new
    diary.add(DiaryEntry.new("title1", "one two"))
    diary.add(DiaryEntry.new("title2", "three four five"))
    expect(diary.count_words).to eq 5
  end
end
```

That's OK. However, we sometimes want to be able to **unit test** `Diary`, so that we can have a test
suite that will fully test the behaviour of `Diary` without relying on any other
classes. 

Then, if the tests for `Diary` fail, we can be _certain_ that `Diary` is broken.
This can be very useful when debugging in a vast codebase.

To do that, we need to change our tests so that `DiaryEntry` is never used. In
theory, we should be able to totally delete `DiaryEntry` and still know that
`Diary` works.

How can we do this?

Firstly, we need to determine how `Diary` will use `DiaryEntry` in this example.
This is a little tricky because we haven't yet written the code, so we might
need to shift back into the design phase for a bit.

Let's say that `Diary#count_words` will call the `#count_words` method on every
`DiaryEntry` instance that it has been asked to store.

Secondly, we need to create fake versions of `DiaryEntry` that will live totally
within our tests. They will behave similarly to a real diary entry, but return
fixed values. Then we pass that to `Diary` instead.

```ruby
RSpec.describe Diary do
  it "counts the words in its entries" do
    diary = Diary.new
    diary.add(FakeTwoWordDiaryEntry.new)
    diary.add(FakeThreeWordDiaryEntry.new)
    expect(diary.count_words).to eq 5
  end
end

class FakeTwoWordDiaryEntry
  def count_words
    return 2
  end
end

class FakeThreeWordDiaryEntry
  def count_words
    return 3
  end
end
```

Now the `Diary` class can be tested in isolation. No matter what mistakes we
make elsewhere in the application, the tests for `Diary` will prove that it
still works as it was designed.

To save us typing, RSpec also provides a concise way to create those fake
objects:

```ruby
RSpec.describe Diary do
  it "counts the words in its entries" do
    diary = Diary.new
    diary.add(double(:fake_diary_entry, count_words: 2))
    diary.add(double(:fake_diary_entry, count_words: 3))
    expect(diary.count_words).to eq 5
  end
end
```

This technique of creating fake classes for testing purposes is called
**mocking**.
