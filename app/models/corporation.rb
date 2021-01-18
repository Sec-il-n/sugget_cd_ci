class Corporation < ApplicationRecord
  with_options presence: true do
    validates :name, length:{ maximum: 20 }
    validates :info, length:{ maximum: 2000 }
  end
  belongs_to :category
end
