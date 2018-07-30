class CreateCatagories < ActiveRecord::Migration[5.1]
  def change
    create_table :catagories do |t|

      t.timestamps
    end
  end
end
