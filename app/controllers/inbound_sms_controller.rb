class InboundSmsController < ApplicationController
  # We disable CSRF for this webhook call
  skip_before_action :verify_authenticity_token

  # Stores an inbound SMS when a webhook
  # from Nexmo is received
  def create
    # Creates a new SMS record in
    # the database
    Sms.create(
      to: params[:to],
      # The number that send the SMS is called a
      # MSISDN in this webhook
      from: params[:msisdn],
      text: params[:text],
      message_id: params[:messageId]
    )

    # Return an empty HTTP 200 status regardless
    head :ok
  end
end
