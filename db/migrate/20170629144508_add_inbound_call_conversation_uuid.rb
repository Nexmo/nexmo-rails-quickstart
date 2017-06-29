class AddInboundCallConversationUuid < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :conversation_uuid, :string
  end
end
