# Unit Testing Terminal IO

Learn to unit test terminal IO using RSpec doubles.

## Introduction

Many programs take input and produce output. However, `puts` is not returning,
and `gets` is not the same as passing arguments. This poses challenges to
testing.

Consider this class.

```ruby
class Greeter
  def greet
    puts "What is your name?"
    name = gets.chomp
    puts "Hello, #{name}!"
  end
end
```

A relatively simple class on the face of it, but a nightmare to test!
`Greeter#greet` doesn't take any arguments, and doesn't return anything either.

To test it, we need to create doubles for `puts` and `gets` so we can check and
control them. But how can we do that when they are plain old methods? This will
take a few steps.

First, we can rephrase this code.

```ruby
class Greeter
  def greet
    Kernel.puts "What is your name?"
    name = Kernel.gets.chomp
    Kernel.puts "Hello, #{name}!"
  end
end
```

`Kernel` is a special object in Ruby that provides a number of special methods
like `gets` and `puts`. You've not seen it until now because it is usually
implicit — Ruby adds in the `Kernel.` behind the scenes.

Now that we have `Kernel` in there, we can create a double for it. We're going
to call it `@io` because it's a bit more descriptive.

```ruby
class Greeter
  def initialize(io)
    @io = io
  end

  def greet
    @io.puts "What is your name?"
    name = @io.gets.chomp
    @io.puts "Hello, #{name}!"
  end
end

RSpec.describe Greeter do
  it "greets the user" do
    io = double :io
    expect(io).to receive(:puts).with("What is your name?")
    expect(io).to receive(:gets).and_return("Kay")
    expect(io).to receive(:puts).with("Hello, Kay!")

    greeter = Greeter.new(io)
    greeter.greet
  end
end

# If we want to run `Greeter` for real, we do it like this
# greeter = Greeter.new(Kernel)
# greeter.greet
```

## Demonstration

[Demonstration Video](https://www.youtube.com/watch?v=znbct4MAp9A&t=6168s)
