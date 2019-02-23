class AddPercentToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :percent, :integer
  end
end
