class AddMessageIdToSms < ActiveRecord::Migration[5.1]
  def change
    add_column :sms, :message_id, :string
  end
end
