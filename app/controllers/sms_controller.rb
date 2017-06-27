class SmsController < ApplicationController

  # Shows the UI for sending an SMS
  def show
    @sms = Sms.new
  end

  # Sends an SMS
  def create
    # Create a SMS record to be stored in the database
    @sms = Sms.new(safe_params)

    if @sms.save
      deliver @sms
      redirect_to :sms, notice: 'SMS Sent'
    else
      flash[:alert] = 'Something went wrong'
      render :show
    end
  end

  private

  # Initializes the Nexmo API client
  def nexmo
    # We do not pass in any API key or secret as
    # we're using environment variables `NEXMO_API_KEY`
    # and `NEXMO_API_SECRET`
    client = Nexmo::Client.new
  end

  # Determines the params that can be
  # stored in the database safely
  def safe_params
    params.require(:sms).permit(:to, :from, :text)
  end

  # Uses the Nexmo API to send the stored
  # SMS message
  def deliver sms
    response = nexmo.send_message(
      from: sms.from,
      to: sms.to,
      text: sms.text
    )

    # If sending the SMS was a success then store
    # the message ID on the SMS record
    if response['messages'].first['status'] == '0'
      sms.update_attributes(
        message_id: response['messages'].first['message-id']
      )
    end
  end
end
