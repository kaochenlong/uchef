class Restaurant < ApplicationRecord
  validates :title, presence: true
end
