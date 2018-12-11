class CreateUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tests, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :test, index: true
    end
  end
end
