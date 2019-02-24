class AddTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer
    add_index :tests, :timer
  end
end
