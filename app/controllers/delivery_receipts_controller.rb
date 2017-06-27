class DeliveryReceiptsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    sms = Sms.find_by_message_id(params[:messageId])
    sms.update_attributes(
      status: params[:status]
    )
  end
end
