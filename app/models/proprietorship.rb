class Proprietorship < ApplicationRecord
  mount_uploader :image, ImageUploader
  with_options presence: true do
    validates :name, length:{ maximum: 20 }
    validates :info, length:{ maximum: 2000 }
    validates :category
  end
  belongs_to :category, optional: true
  # https://railsguides.jp/association_basics.html#belongs-toとhas-oneのどちらを選ぶか
  # belongs_to :user, foreign_key: 'proprietorship_id'
  has_one :user, foreign_key: 'proprietorship_id'
  # polymorphic: 適応後　追加
  # has_many :images, as: :imageable
end
