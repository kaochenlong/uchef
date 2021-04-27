class CreateFavoriteRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_restaurants do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
