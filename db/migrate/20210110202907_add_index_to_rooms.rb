class AddIndexToRooms < ActiveRecord::Migration[5.2]
  def change
    add_index :rooms, :sender_id
    add_index :rooms, :recipient_id
    add_index :rooms, [:sender_id, :recipient_id], unique: true
  end
end
