class Message < ApplicationRecord
  include MessageModelConcern
  with_options presence: true do
    validates :text, length: { maximum: 100 }
    validates :room_id
    validates :user_id
  end
  belongs_to :room
  belongs_to :user
end
