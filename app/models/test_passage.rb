class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  scope :successful, -> { where(percent: SUCCESS_PERCENT..100) }

  before_validation :before_validation_set_next_question

  validates :percent, inclusion: 0..100, allow_nil: true

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def complete!(timer_valid: true)
    if timer_valid
      self.percent = result
      save!
    end

    TestPassageMailer.result_email(self).deliver_now
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def result
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def success_result?
    percent && percent >= SUCCESS_PERCENT
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
    timer = test.timer
    timer ? (self.created_at + timer.minutes - Time.current).ceil : Float::INFINITY
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question unless percent
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
