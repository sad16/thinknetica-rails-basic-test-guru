class User < ApplicationRecord
  has_many :results

  def tests_by_level(level)
    Test.joins(:results).where(results: results, level: level)
  end
end
