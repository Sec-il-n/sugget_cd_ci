class Suggest < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :details, length: { maximum: 2000 }
  end
  scope :category_search, -> (category_id) {  where(category_id: category_id) }
  # suggest.user.corporation_id
  # user.corporation.where(category_id: category_id)
  # scope :corporation, -> (category_id) { where }
  belongs_to :user
  has_many :suggest_tags, dependent: :destroy, foreign_key: 'suggest_id'
  has_many :tags, through: :suggest_tags
  # .invalid-⤵︎　 # required
  # accepts_nested_attributes_for :suggest_tags, allow_destroy: true
  # どっちにせよいらん↑　
end
