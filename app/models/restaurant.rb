class Restaurant < ApplicationRecord
  acts_as_paranoid

  validates :title, presence: true
  belongs_to :user
  has_many :comments
end

