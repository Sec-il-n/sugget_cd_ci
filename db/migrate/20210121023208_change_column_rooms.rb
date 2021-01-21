class ChangeColumnRooms < ActiveRecord::Migration[5.2]
  def change
    change_column_null :rooms, :sender_id, true, 0
    change_column_null :rooms, :recipient_id, true, 0
  end
end
