# Exercise

Unit test this class.

```ruby
require 'date'
require 'json'
require 'net/http'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def error
    return get_server_time - Time.now
  end

  private

  def get_server_time
    text_response = Net::HTTP.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end
```

To make this testable, you will need to create a double for `Net:HTTP` and also
deal with the behaviour of `Time.now` which is also non-deterministic.

<!-- OMITTED -->

[Example Solution](https://www.youtube.com/watch?v=znbct4MAp9A&t=5625s)
