class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string
    add_index :users, :role
  end
end
