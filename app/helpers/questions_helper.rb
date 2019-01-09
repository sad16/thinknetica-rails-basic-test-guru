module QuestionsHelper
  def new_or_edit_question_path(question)
    return test_questions_path(question.test) if question.new_record?

    question_path(question)
  end
end
