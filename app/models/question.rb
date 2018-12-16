class Question < ApplicationRecord
  ANSWERS_COUNT_RANGE = 1..4

  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :answers, length: { in: ANSWERS_COUNT_RANGE }
end
