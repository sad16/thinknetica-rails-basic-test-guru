class AddFinishedAtToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :finished_at, :datetime
  end
end
