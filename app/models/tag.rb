class Tag < ApplicationRecord
  has_many :suggest_tags
  has_many :suggests, through: :suggest_tags#, source: :suggest　#有無どっちもOK
end
