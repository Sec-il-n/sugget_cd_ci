class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 30 }
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # accepts_nested_attributes_for: :corporations, reject_if: :reject_both_blank, allow_destroy: true

  belongs_to :corporation, optional: true
  belongs_to :proprietorship, optional: true
  has_many :suggests
  # has_many :participants
  # has_many :suggests_on_going, through: :participants, source: :suggests
end
