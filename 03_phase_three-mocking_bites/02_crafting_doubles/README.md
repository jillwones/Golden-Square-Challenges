# Crafting Doubles

Learn to craft doubles for specific purposes.

## Introduction

In the last bite we introduced doubles. Doubles are a tool that we use when we
want to test that one class interacts with another in the correct way. We create
a double that acts the same as the collaborator class, and then verify that the
class we're trying to test does its job correctly.

To do this we have to create a double whose public interface matches the public
interface of the class we're trying to test. In this bite we will zoom in on how
to create doubles with specific requirements.

Below are some examples of how you can use doubles. Each example shows you how
the double might be created as a class first, and then how it can be created
using a double. Going forward you will usually use the doubling techniques only.

### An Object

```ruby
# As a class
class FakeObject

end

fake_object = FakeObject.new

# As a double
RSpec.describe "example" do
  it "example" do
    fake_object = double(:fake_object)
  end
end
```

### An Object With Methods

```ruby
# As a class
class FakeObject
  def greet
    return "Hello, world!"
  end
end

fake_object = FakeObject.new
fake_object.greet # => "Hello, world!"

# As a double
RSpec.describe "example" do
  it "example" do
    # This creates the double
    fake_object = double(:fake_object, greet: "Hello, world!")

    # This is just to show you what it can now do
    expect(fake_object.greet).to eq "Hello, world!"
  end
end
```

### To Make Methods Only Return Values With Given Arguments

```ruby
# As a class
class FakeObject
  def greet(name)
    fail unless name == "Kay"
    return "Hello, Kay!"
  end
end

fake_object = FakeObject.new
fake_object.greet("Kay") # => "Hello, Kay!"
fake_object.greet("Henry") # Raises an error

# As a double
RSpec.describe "example" do
  it "example" do
    # This creates the double
    fake_object = double(:fake_object)
    # This creates a 'stub' (fake method) on the double
    allow(fake_object).to receive(:greet).with("Kay").and_return("Hello, Kay!")

    # This is just to show you what it can now do
    expect(fake_object.greet("Kay")).to eq "Hello, Kay!"
    fake_object.greet("Henry") # This will throw an error
  end
end
```

### To Verify Methods Are Called With Given Arguments

```ruby
# As a class
class FakeObject
  def initialize
    @greet_has_been_called = false
  end

  def greet(name)
    fail unless name == "Kay"
    @greet_has_been_called = true
    return "Hello, Kay!"
  end

  def has_greet_been_called
    return @greet_has_been_called
  end
end

fake_object = FakeObject.new
fake_object.has_greet_been_called # => false
fake_object.greet("Kay") # => "Hello, Kay!"
fake_object.has_greet_been_called # => true
fake_object.greet("Henry") # Raises an error


# As a double
RSpec.describe "example" do
  it "example" do
    # This creates the double
    fake_object = double(:fake_object)
    # This creates a 'stub' (fake method) on the double
    # But using 'expect' means the test will fail unless it is called.
    expect(fake_object).to receive(:greet).with("Kay").and_return("Hello, Kay!")

    # This is just to show you what it can now do
    expect(fake_object.greet("Kay")).to eq "Hello, Kay!"
    fake_object.greet("Henry") # This will throw an error
    # If you comment out the above two lines, the test will fail.
  end
end
```
