class AddRestaurantIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :restaurant_id, :integer
  end
end
