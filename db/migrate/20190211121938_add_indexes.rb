class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :title, unique: true
    add_index :users, :last_name
    add_index :users, :first_name
  end
end
