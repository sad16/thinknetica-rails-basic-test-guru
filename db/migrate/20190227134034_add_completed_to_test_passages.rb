class AddCompletedToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :completed, :boolean, null: false, default: false
  end
end
