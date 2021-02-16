class Image < ApplicationRecord
  mount_uploader :image, ImageUploader#uploader  modelの複数形?
  belongs_to :suggest, optional: true, foreign_key: 'suggest_id'
end
