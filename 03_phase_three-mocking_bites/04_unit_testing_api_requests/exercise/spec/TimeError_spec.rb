require 'TimeError'

describe TimeError do 
  it 'returns the difference between server time and time on this computer' do 
    requester_double = double(:requester)
    allow(requester_double).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"140.228.47.196","datetime":"2022-11-15T18:59:39.094206+00:00","day_of_week":2,"day_of_year":319,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668538779,"utc_datetime":"2022-11-15T18:59:39.094206+00:00","utc_offset":"+00:00","week_number":46}')
    time = Time.new(2022, 11, 15, 19, 15, 26)
    time_error = TimeError.new(requester_double)
    expect(time_error.error(time)).to eq(-946.905794)
  end
end