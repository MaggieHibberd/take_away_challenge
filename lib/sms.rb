class Sms

    require 'twilio-ruby'
    require("bundler")
    Bundler.require()
    def send
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]
    
        @client = Twilio::REST::Client.new(account_sid, auth_token)
    
        time = Time.now + 40*60  
        hour = time.strftime("%k:%M")
    
        @client.messages.create(
        to: ENV["MY_PHONE_NUMBER"],
        from: ENV["TWILIO_PHONE_NUMBER"],
        body: "Your meal will arrive in #{hour} mins"
        )
        end 
    end
    