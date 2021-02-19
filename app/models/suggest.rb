class Suggest < ApplicationRecord
  include SuggestModelConcern
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :details, length: { maximum: 2000 }
  end

  belongs_to :user, optional: true
  belongs_to :category, optional: true

  has_many :suggest_tags, dependent: :destroy, foreign_key: 'suggest_id'
  has_many :tags, through: :suggest_tags
  has_many :participants, dependent: :destroy, foreign_key: 'suggest_id'
  has_many :users, through: :participants
  has_many :comments, dependent: :destroy, foreign_key: 'suggest_id'

  has_many :images, dependent: :destroy, foreign_key: 'suggest_id'
  accepts_nested_attributes_for :images, allow_destroy: true#, reject_if: :reject_blank

  has_one :room, foreign_key: 'suggest_id', dependent: :destroy#, optional: true

  scope :category_search, -> (category_id) {  where(category_id: category_id) }
  scope :default_orderd, -> { order(created_at: :desc) }
end
