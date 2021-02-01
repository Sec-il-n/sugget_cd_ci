class Participant < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :suggest, optional: true
end
