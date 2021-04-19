class AddUserToRestaurant < ActiveRecord::Migration[6.1]
  def change
    # add_column :restaurants, :user_id, :integer
    # add_index :restaurants, :user_id

    add_reference(:restaurants, :user)
  end
end
