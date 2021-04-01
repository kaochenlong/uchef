class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :title
      t.string :address
      t.string :tel
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
