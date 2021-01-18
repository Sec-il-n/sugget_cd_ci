class Category < ApplicationRecord
  has_many :proprietorships
  has_many :corporation
end
