class Contact < ApplicationRecord
  validates :content, presence: true, length: { maximum: 600 }
  belongs_to :user, optional: true
end
