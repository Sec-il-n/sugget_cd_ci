class Room < ApplicationRecord
  has_many :message_rooms
  has_many :users, through: :message_rooms
  has_many :messages, dependent: :destroy
  belongs_to :suggest, optional: true
end
