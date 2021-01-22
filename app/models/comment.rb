class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :suggest
  scope :recent, -> { order(created_at: :DESC) }
end
