class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify
  has_many :gists, dependent: :nullify
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :last_name,
            :first_name,
            presence: true

  def admin?
    is_a?(Admin)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def test_successful?(test)
    test_passage(test)&.success_result?
  end

  def tests_by_category(category)
    tests.category(category)
  end

  def tests_by_level(level)
    tests.level(level)
  end
end
