class ChangeColumnMessages < ActiveRecord::Migration[5.2]
  def change
    change_column_null :messages, :user_id, true, 0
    change_column_null :messages, :room_id, true, 0
  end
end
