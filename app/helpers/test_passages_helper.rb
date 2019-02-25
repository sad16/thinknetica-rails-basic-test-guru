module TestPassagesHelper
  def result_title(test_passage)
    result = test_passage.success_result? ? 'Successfully' : 'Unsuccessfully'
    "The #{test_passage.test.title} Test was #{result} Completed!"
  end

  def result_color(test_passage)
    test_passage.success_result? ? 'green' : 'red'
  end

  # def timer(test_passage)
  #   return if test_passage.second_to_end == Float::INFINITY

  #   I18n.t('test_passages.helpers.timer', count: (test_passage.second_to_end.to_f / 60).ceil)
  # end
end
