class AddExtraFieldsToCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :uuid, :string
    add_column :calls, :status, :string
  end
end
