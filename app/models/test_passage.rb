class TestPassage < ApplicationRecord
  SUCCESS_PERSENT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    save!
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def result
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def success_result?
    result >= SUCCESS_PERSENT
  end

  private

  def before_validation_set_next_question
    if test.present?
      sorted_questions = test.questions.order(:id)
      sorted_questions = sorted_questions.where('id > ?', current_question.id) if persisted?

      self.current_question = sorted_questions.first
    end
  end

  def correct_answer?(answers_ids)
    answers_ids ||= []
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
