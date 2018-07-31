class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :meal_id
      t.integer :quantity

      t.timestamps
    end
  end
end
