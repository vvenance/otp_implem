require 'twilio-ruby'

Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token  = ENV['TWILIO_AUTH_TOKEN']
end

$twilio_client = Twilio::REST::Client.new
$twilio_service = $twilio_client.verify.services.create(friendly_name: 'OTP_demo_service')