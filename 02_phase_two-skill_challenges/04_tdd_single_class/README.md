# TDD Single Class

## Introduction

Test-driving a single-class program is similar to test-driving a single-method
program. Our approach differs purely because methods and classes are different.

**A method** is a reusable chunk of code that takes input as arguments and
returns a value.

**An object** is a structure that wraps ('encapsulates') a collection of values
(called 'state' or 'memory') and exposes some methods that can operate on that
state.

**A class** is a blueprint for creating objects.

**In object-oriented programming, the most important unit of behaviour is the
class.** We build our programs by creating classes that work together to
accomplish the job of the program.

## Creating Examples for Single-Class Programs

Instead of an example like this:

```ruby
extract_uppercase("hello WORLD") => ["WORLD"]
```

We will need to create examples of the behaviour of the class, like this:

```ruby
gratitudes = Gratitudes.new
gratitudes.add("your cat")
gratitudes.add("nice people")
expect(gratitudes.format).to eq "Be grateful for: your cat, nice people"
```    

Summary: Testing classes differs from testing single methods due to the fact when testing classes we don't necessarily test each method individually, we do sometimes but that isn't the focus. When testing classes you are more interested in testing expected behaviours and then implementing those behaviours - higher level view of the class.