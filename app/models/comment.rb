class Comment < ApplicationRecord
  validates :text, presence: true, length: { maximum: 300 }
  belongs_to :user, optional: true
  belongs_to :suggest, optional: true
  scope :recent, -> { order(created_at: :DESC) }
end
