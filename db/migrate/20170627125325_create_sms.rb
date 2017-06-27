class CreateSms < ActiveRecord::Migration[5.1]
  def change
    create_table :sms do |t|
      t.string :to
      t.string :from
      t.text :text
      t.boolean :is_inbound
      t.timestamp :delivered_at

      t.timestamps
    end
  end
end
