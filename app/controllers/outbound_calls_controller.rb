class OutboundCallsController < ApplicationController

  # Shows the UI for making a call
  def index
    @call = Call.new
  end

  # Make a call
  def create
    # Create a call record to be stored in the database.
    # This is technically not necessary, but it allows us to store the
    # text to be spoken in the database
    @call = Call.new(safe_params)

    if @call.save
      make @call
      redirect_to :outbound_calls, notice: 'Call initiated'
    else
      flash[:alert] = 'Something went wrong'
      render :index
    end
  end

  # Returns the message to play on the phone call
  def show
    # Find the call
    call = Call.find(params[:id])
    # Return a JSON object with the message for the call
    # and also specifying the voice name to use
    render json: [
        {
            "action": "talk",
            "voiceName": "Russell",
            "text": call.text
        }
    ]
  end

  private

  # Initializes the Nexmo API client
  def nexmo
    # We do not pass in any API key or secret as
    # we're using environment variables `NEXMO_API_KEY`
    # and `NEXMO_API_SECRET`
    client = Nexmo::Client.new(
      application_id: ENV['NEXMO_APP_ID'],
      private_key: File.read(ENV['NEXMO_PRIVATE_KEY_FILE'])
    )
  end

  # Determines the params that can be
  # stored in the database safely
  def safe_params
    params.require(:call).permit(:to, :from, :text)
  end

  # Uses the Nexmo API to initiate the call
  def make call
    # Make a call to the number provided,
    # from the Nexmo number provided
    options = {
      to: [
        {
          type: 'phone',
          number: call.to
        }
      ],
      from: {
        type: 'phone',
        number: call.from
      },
      # When the call connects, make a webhook
      # to the inbound_calls#show method and play back
      # the voice message specified
      answer_url: [
        # We need to specify the actual, public port and hostname
        # when using a proxy like Ngrok
        outbound_call_url(call, host: ENV['NEXMO_SERVER_HOSTNAME'], port: 80)
      ]
    }
    response = nexmo.create_call(options)

    # If the call was successfully started,
    # update the status for this call
    call.update_attributes(
      uuid: response['uuid'],
      status: response['status']
    ) if response['status'] && response['uuid']
  end
end
