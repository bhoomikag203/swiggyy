class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phno
      t.string :category

      t.timestamps null: false
    end
  end
end
