class User < ApplicationRecord
  mount_uploader :user_image, UserImageUploader

  validates :user_name, presence: true, length: { maximum: 30 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :corporation, optional: true
  belongs_to :proprietorship, optional: true

  has_many :suggests
  has_many :participants
  has_many :suggests_on_going, through: :participants, source: :suggests
  has_many :message_rooms
  has_many :rooms, through: :message_rooms
  has_many :messages
  has_many :comments, foreign_key: 'user_id'
  has_many :contacts, foreign_key: 'user_id'
end
