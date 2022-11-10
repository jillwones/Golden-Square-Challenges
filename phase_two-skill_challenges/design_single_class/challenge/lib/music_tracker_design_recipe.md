# Challenge Class Design Recipe

## 1. Describe the Problem

> As a user     
> So that I can keep track of my music listening     
> I want to add tracks I've listened to and see a list of them.   


## 2. Design the Class Interface

```ruby
class MusicTracker
  def initialize
    @music_library = {}
  end
  
  def add(artist, song)
    # artist and song are both strings
    # this method should add the song to the correct artist in the hash if artist present
    # if not makes a new artist and adds the song to the new artist
    # returns nothing
  end
    
  def list_all
   # takes no parameters
   # outputs list of all artists and their songs
   # if empty it raises 'No music in library'
  end 

  def list_artist(artist)
   # raises error if artist not in library
   # shows all the songs for that artist in the library
  end
end
  
   
```

Steps 3 and 4 then operate as a cycle.

## 3. Create Examples as Tests

```ruby
# 1
music_library = MusicTracker.new 
music_library.list_all # => 'Empty music library'

# 2
music_library = MusicTracker.new 
music_library.add('Aerosmith', 'Dream On')
music_library.list_all # => ["Music Library:", "* Aerosmith: Dream On"].join("\n") + "\n"

# 3
music_library = MusicTracker.new 
music_library.add('Aerosmith', 'Dream On')
music_library.add('Aerosmith', 'Sweet Emotion')
music_library.list_all # => ["Music Library:", "* Aerosmith: Dream On, Sweet Emotion"].join("\n") + "\n"

# 4
music_library = MusicTracker.new 
music_library.add('Aerosmith', 'Dream On')
music_library.add('Calvin Harris', 'Acceptable In the 80s')
music_library.list_all # => ["Music Library:", "* Aerosmith: Dream On", "* Calvin Harris: Acceptable In the 80s"].join("\n") + "\n"

# 5
music_library = MusicTracker.new 
music_library.add('Aerosmith', 'Dream On')
music_library.add('Calvin Harris', 'Acceptable In the 80s')
music_library.list_artist('Aerosmith') # => ["Songs by Aerosmith:", "* Aerosmith: Dream On"].join("\n") + "\n"

# 6
music_library = MusicTracker.new 
music_library.add('Aerosmith', 'Dream On')
music_library.list_artist('Drake') # => 'No songs by this artist in your music library'
```

## 4. Implement the Behaviour

For each example you create as a test, implement the behaviour that allows the
class to behave according to your example.

At this point you may wish to apply small-step test-driving to manage the
complexity. This means you only write the minimum lines of the example to get
the test to fail (red), then make it pass (green) and refactor, before adding
another line to the test until it fails, then continue.

Then return to step 3 until you have addressed the problem you were given. You
may also need to revise your design, for example if you realise you made a
mistake earlier.
