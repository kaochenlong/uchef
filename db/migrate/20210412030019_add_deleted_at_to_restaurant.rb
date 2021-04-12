class AddDeletedAtToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :deleted_at, :datetime
    add_index :restaurants, :deleted_at
  end
end
