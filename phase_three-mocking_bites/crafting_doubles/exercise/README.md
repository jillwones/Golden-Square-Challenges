# Exercise

Create doubles to pass these tests.

```ruby
RSpec.describe "doubles" do
  # Change `xit` to `it` one by one as you work through.

  xit "sets up a blank double" do
    # Set up your doubles here
    fake_object = # ...

    # Don't edit below
    expect(fake_object).to be
  end

  xit "sets up a double with methods" do
    # Set up your doubles here
    fake_object = # ...

    # Don't edit below
    expect(fake_object.speak).to eq "Meow"
    expect(fake_object.count_ears).to eq 2
    expect(fake_object.count_legs).to eq 4
  end

  xit "sets up a double with methods that take arguments" do
    # Set up your doubles here
    fake_object = # ...

    # Don't edit below
    expect(fake_object.speak("Jess")).to eq "Meow, Jess"
    # Don't stub this next one
    # It's just to verify you've set up the double correctly
    expect { fake_object.speak("Ron") }.to raise_error RSpec::Mocks::MockExpectationError
  end

  xit "sets up doubles that expect to be called" do
    fake_object = double :animal
    # Write an expectation below that the method "speak" is called with
    # the argument "Steve"

    # ...

    # Don't edit below
    fake_object.speak("Steve")
  end

  xit "creates a double for a specific case" do
    fake_diary = double :diary, add: nil
    # Set up this double to pass the tests below
    # ...

    # Don't edit below
    fake_diary.add(double :diary_entry)
    fake_diary.add(double :diary_entry)
    expect(fake_diary.count_entries).to eq 2
  end
end
```
