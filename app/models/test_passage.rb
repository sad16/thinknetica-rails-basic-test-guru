class TestPassage < ApplicationRecord
  SUCCESS_PERSENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question

  before_create :before_create_set_finished_at

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
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

  def next_question
    if test.present?
      sorted_questions = test.questions.order(:id)
      sorted_questions = sorted_questions.where('id > ?', current_question.id) if persisted?
      sorted_questions.first
    end
  end

  def timer_valid?
    second_to_end.positive?
  end

  def second_to_end
    self.finished_at ? self.finished_at.to_i - Time.current.to_i : Float::INFINITY
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_create_set_finished_at
    timer = test.timer
    self.finished_at = self.created_at + timer.minutes if timer
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
