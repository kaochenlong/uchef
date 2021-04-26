class Restaurant < ApplicationRecord
  acts_as_paranoid

  validates :title, presence: true
  belongs_to :user
  has_many :comments

  has_many :favorite_restaurants
  has_many :likers, through: :favorite_restaurants,
                              source: :user
end

