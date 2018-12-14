class User < ApplicationRecord
  has_many :results, dependent: :restrict_with_exception
  has_many :tests, through: :results
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :restrict_with_exception

  def tests_by_level(level)
    tests.where(level: level)
  end
end
