class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates_presence_of :text, :room_id, :user_id
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
