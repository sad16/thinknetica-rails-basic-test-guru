class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_question_answers_count, on: :create

  def validate_question_answers_count
    return if question.answers.count < Question::MAX_ANSWERS_COUNT

    errors.add(:question)
  end
end
