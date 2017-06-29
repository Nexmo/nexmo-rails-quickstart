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
            status: params[:status],
            conversation_uuid: params[:conversation_uuid],
            is_inbound: (params[:direction] == 'inbound')
          )
    end

    # Return an empty HTTP 200 status
    head :ok
  end
end
