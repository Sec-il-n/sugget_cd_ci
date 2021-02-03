class Image < ApplicationRecord
  mount_uploader :image, ImageUploader#uploader  modelの複数形?
  # mount_uploaders :images, ImageUploader#uploader  modelの複数形?
  # serialize :image, JSON #複数の画像をアップロードをする場合は左の1文が必要 カラムのデータ型がJSONの場合不要
  belongs_to :suggest, optional: true, foreign_key: 'suggest_id'

  # polymorphic: 適応後　こっちへシフト
  # belongs_to :imageable, polymorphic: true
end
