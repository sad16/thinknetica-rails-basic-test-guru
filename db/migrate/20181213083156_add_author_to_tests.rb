class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, null: false, foreign_key: true
  end
end
