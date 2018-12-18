class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true

  def tests_by_level(level)
    tests.level(level)
  end
end
