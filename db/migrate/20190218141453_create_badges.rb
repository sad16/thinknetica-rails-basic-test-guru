class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.integer :rule_name, null: false
      t.string :rule_value, null: false

      t.timestamps
    end

    add_index :badges, :name, unique: true
  end
end
