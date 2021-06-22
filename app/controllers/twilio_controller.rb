class TwilioController < ApplicationController
	def init_otp

	end

	def verify
		verification = $twilio_client.verify
						.services($twilio_service.sid)
						.verification
						.create(to: params["phone_number"], channel: 'sms')
		@phone_number = params["phone_number"]
	end

	def validate_token
		verification_check = $twilio_client.verify
								.services($twilio_service.sid)
								.verification_checks
								.create(to: params["phone_number"], code: params["verification_code"])

		if verification_check.status == "approved"
			redict_to action: "validated"
		else
			flash.alert = "Wrong code, try again"
			@phone_number = params["phone_number"]
			render "verify"
		end
		
	end


	def validated

	end

end