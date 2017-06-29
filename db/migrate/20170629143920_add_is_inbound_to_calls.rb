class AddIsInboundToCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :is_inbound, :boolean
  end
end
