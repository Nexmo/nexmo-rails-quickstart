class InboundCallsController < ApplicationController
  # We disable CSRF for this webhook call
  skip_before_action :verify_authenticity_token

  # Stores an inbound Call's details when a webhook
  # from Nexmo is received
  def create
    # Creates a new Call record in the database.
    # Storing these details is not really necessary to make the call
    # but it's useful for keeping track what calls have been made
    Call.where(conversation_uuid: params[:conversation_uuid])
        .first_or_create
        .update_attributes(
          # Update to store the Nexmo number this call was made to
          to: params[:to],
          # Also update the number that made the call
          from: params[:from]
        )

    # Return an message to play back to the caller
    render json: [
      {
        action: 'talk',
        voiceName: 'Jennifer',
        text: 'Hello, thank you for calling. This is Jennifer from Nexmo. Ciao.'
      }
    ]
  end
end
