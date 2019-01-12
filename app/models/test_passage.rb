class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    save!
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
