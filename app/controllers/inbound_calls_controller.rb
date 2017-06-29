class InboundCallsController < ApplicationController
  # We disable CSRF for this webhook call
  skip_before_action :verify_authenticity_token

  # Stores an inbound Call's details when a webhook
  # from Nexmo is received
  def create
    # Creates a new Call record in
    # the database
    Call.where(conversation_uuid: params[:conversation_uuid])
        .first_or_create
        .update_attributes(
          # The Nexmo number this call was made to
          to: params[:to],
          # The number that made the call
          from: params[:from]
        )

    puts params[:from].inspect


    # Return an message for the caller
    render json: [
      {
        action: 'talk',
        voiceName: 'Jennifer',
        text: 'Hello, thank you for calling. This is Jennifer from Nexmo. Ciao.'
      }
    ]
  end
end
