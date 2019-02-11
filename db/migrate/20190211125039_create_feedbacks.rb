class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.text :message, null: false

      t.timestamps
    end

    add_index :feedbacks, :email
  end
end
