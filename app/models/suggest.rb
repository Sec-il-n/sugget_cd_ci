class Suggest < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :details, length: { maximum: 1000 }
  end

end
