class DropSmsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :sms, :delivery_started_at
    remove_column :sms, :delivered_at
    add_column :sms, :status, :string
  end
end
