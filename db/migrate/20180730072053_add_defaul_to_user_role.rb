class AddDefaulToUserRole < ActiveRecord::Migration[5.1]
  def change
    add_column :user_roles, :role, :integer
    add_column :user_roles, :default, :0
  end
end
