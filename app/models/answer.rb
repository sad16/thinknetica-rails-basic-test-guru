class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_question_answers_count

  def validate_question_answers_count
    return if question.answers.count < Question::ANSWERS_COUNT_RANGE.max

    errors.add(:question)
  end
end
