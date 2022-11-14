## Exercise

Consider these class designs:

```ruby
# File: lib/secret_diary.rb

class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    # ...
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
  end

  def lock
    # Locks the diary
    # Returns nothing
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
  end
end
```

```ruby
# File: lib/diary.rb

class Diary
  def initialize(contents) # contents is a string
  end

  def read
    # Returns the contents of the diary
  end
end
```

Test-drive these classes. Include:

1. Integration tests
2. Unit tests, exercising _all_ of the class's functionality, _without_ using or
   referring to the other class.
