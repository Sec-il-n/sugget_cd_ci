class User < ApplicationRecord
  mount_uploader :user_image, UserImageUploader
  validates :user_name, presence: true, length: { maximum: 30 }
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :corporation, optional: true
  # accepts_nested_attributes_for :corporation, reject_if: :reject_both_blank, allow_destroy: true
  has_many :suggests
  belongs_to :proprietorship
  # accepts_nested_attributes_for :proprietorship, reject_if: :reject_both_blank, allow_destroy: true

  has_many :participants
  has_many :suggests_on_going, through: :participants, source: :suggests
end
