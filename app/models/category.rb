class Category < ApplicationRecord
  has_many :proprietorships
  has_many :corporation
  has_many :suggests, foreign_key: 'category_id'
end
