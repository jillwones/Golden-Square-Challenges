require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio.env')

class Text 
  def initialize(requester=Twilio::REST::Client)
    @requester = requester
    @client = requester.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_text(number)
    delivery_time = (Time.now + 1200).strftime("%I:%M %p")
    message = @client.messages.create(
                             body: "Your order will be with you at #{delivery_time}",
                             from: '+13022483728',
                             to: "+#{number}"
                           )

    puts message.sid
  end
end

