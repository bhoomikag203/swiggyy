class RemoveCatagoryFromMeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :meals, :catagory, :string
  end
end
