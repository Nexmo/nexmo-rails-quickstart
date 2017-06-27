class AddDeliveryStartedAtToSms < ActiveRecord::Migration[5.1]
  def change
    add_column :sms, :delivery_started_at, :timestamp
  end
end
