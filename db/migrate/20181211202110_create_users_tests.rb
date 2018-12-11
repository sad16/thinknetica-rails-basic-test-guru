class CreateUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests_users, id: false do |t|
      t.belongs_to :test, index: true
      t.belongs_to :user, index: true
    end
  end
end
