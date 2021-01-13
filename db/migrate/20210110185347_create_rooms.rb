class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.bigint :sender_id
      t.bigint :recipient_id
      t.timestamps
    end
  end
end
