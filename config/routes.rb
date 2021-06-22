Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'twilio#init_otp'
  post 'verify', to: 'twilio#verify'
  post 'validate_token', to: 'twilio#validate_token'
  get 'validated', to: 'twilio#validated'
end
