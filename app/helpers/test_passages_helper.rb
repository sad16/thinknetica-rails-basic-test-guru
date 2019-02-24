module TestPassagesHelper
  def result_title(test_passage)
    result = test_passage.success_result? ? 'Successfully' : 'Unsuccessfully'
    "The #{test_passage.test.title} Test was #{result} Completed!"
  end

  def result_color(test_passage)
    test_passage.success_result? ? 'green' : 'red'
  end

  def timer(test_passage)
    return nil if test_passage.second_to_end == Float::INFINITY

    "Time to end #{pluralize((test_passage.second_to_end / 60), 'minute')}"
  end
end
