class InboundSmsController < ApplicationController
  # We disable CSRF for this webhook call
  skip_before_action :verify_authenticity_token

  # Stores an inbound SMS when a webhook
  # from Nexmo is received
  def create
    # Creates a new SMS record in
    # the database
    sms = Sms.create(
      to: params[:to],
      # The number that send the SMS is called a
      # MSISDN in this webhook
      from: params[:msisdn],
      text: params[:text],
      message_id: params[:messageId],
      # Seperate inbound SMS from outbound ones
      is_inbound: true
    )

    # Send a reply
    reply sms

    # Return an empty HTTP 200 status regardless
    head :ok
  end

  private

  # Initializes the Nexmo API client
  def nexmo
    # We do not pass in any API key or secret as
    # we're using environment variables `NEXMO_API_KEY`
    # and `NEXMO_API_SECRET`
    client = Nexmo::Client.new
  end

  # Uses the Nexmo API to send a quick reply to the SMS received
  # for simplicity we're not storing this one in the database
  def reply sms
    nexmo.send_message(
      from: sms.to,
      to: sms.from,
      text: sms.text.reverse
    )
  end
end
