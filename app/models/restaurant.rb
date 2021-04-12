class Restaurant < ApplicationRecord
  acts_as_paranoid

  validates :title, presence: true
end
