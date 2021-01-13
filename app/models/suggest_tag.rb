class SuggestTag < ApplicationRecord
  belongs_to :tag, optional: true#バリデーションcheck(FK not null) skip
  belongs_to :suggest, optional: true
end
