class StripeController < ApplicationController
  allow_unauthenticated_access only: %i[ checkout success ]
  def checkout
    Stripe.api_key = Rails.application.credentials.production.stripe.sk
    session = Stripe::Checkout::Session.create({
               line_items: [ {
                               price: "price_1QCDZcLGzLJRPfWyugtjfcUr",
                               quantity: 1
                             } ],
               mode: "payment",
               success_url: stripe_success_url,
               cancel_url: root_url
             })
    redirect_to session.url, allow_other_host: true
  end

  def success
  end
end
