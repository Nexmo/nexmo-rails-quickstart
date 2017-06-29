class OutboundCallWebhooksController < ApplicationController
  # We disable CSRF for this webhook call
  skip_before_action :verify_authenticity_token

  # Updates a Call's status when an update event comes in
  def create
    # Find the Call for the UUID UUID, and update it with the
    # status, only if the Message ID was provided
    Call.where(uuid: params[:uuid])
       .update_all(status: params[:status]) if params[:uuid]

    # Return an empty HTTP 200 status
    head :ok
  end
end
