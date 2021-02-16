class Tag < ApplicationRecord
  has_many :suggest_tags
  has_many :suggests, through: :suggest_tags
  attr_accessor :tag_id
  validates :name, presence: true, length: { maximum: 20 }
end
