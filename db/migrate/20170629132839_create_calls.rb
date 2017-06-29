class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.string "to"
      t.string "from"
      t.text "text"

      t.timestamps
    end
  end
end
