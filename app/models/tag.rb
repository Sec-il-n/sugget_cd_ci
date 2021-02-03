class Tag < ApplicationRecord
  has_many :suggest_tags
  has_many :suggests, through: :suggest_tags#, source: :suggest　#有無どっちもOK
  attr_accessor :tag_id# :idだと["on","on"]だったのが一瞬直ったが、またrequest POSTに戻る
end
