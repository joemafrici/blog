if Rails.env.production?
  if Rails.application.credentials.stripe.present?
    Stripe.api_key = Rails.application.credentials.stripe.sk
  else
    puts "Stripe credentials not set. Check your credentials file"
  end
end

if Rails.env.development?
   if Rails.application.credentials.stripe.present?
     Stripe.api_key = Rails.application.credentials.stripe.sk
   else
     puts "Stripe credentials not set. Check your credentials file"
   end
end
