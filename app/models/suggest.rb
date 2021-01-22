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
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :reject_blank, allow_destroy: true
  # mount_uploaders :images, ImageUploader#uploader  modelの複数形?
  # serialize :image, JSON #複数の画像をアップロードをする場合は左の1文が必要 カラムのデータ型がJSONの場合不要
  belongs_to :room, foreign_key: 'suggest_id'

  has_many :comments, dependent: :destroy, foreign_key: 'suggest_id'

  def reject_blank(attributes)
    exists = attributes[:id].present?
    empty = attributes[:image].blank?
    # レコードとして保存済みでかつメールアドレスが空のものに { _destroy: 1 } を追加
    attributes.merge!(_destroy: 1) if exists && empty
    # 戻り
    !exists && empty
  end
end
