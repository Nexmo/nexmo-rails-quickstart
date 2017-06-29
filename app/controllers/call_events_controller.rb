class CallEventsController < ApplicationController
  # We disable CSRF for this webhook call
  skip_before_action :verify_authenticity_token

  # Updates a Call's status when an update event comes in
  def create
    # Find the Call for the UUID UUID, and update it with the
    # status, only if the Message ID was provided
    if params[:uuid]
      Call.where(uuid: params[:uuid])
          .first_or_create
          .update(
            # Update the status of the call
            status: params[:status],
            # Update the conversation ID
            conversation_uuid: params[:conversation_uuid],
            # Additionally, check if the call was inbound,
            # and if so mark it as such
            is_inbound: (params[:direction] == 'inbound')
          )
    end

    # Return an empty HTTP 200 status
    head :ok
  end
end
