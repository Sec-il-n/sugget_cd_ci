class AddColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :suggest, foreign_key: true, null: false
  end
end
