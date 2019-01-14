module TestPassagesHelper
  def result_title(test_passage)
    result = test_passage.success_result? ? 'Successfully' : 'Unsuccessfully'
    "The #{test_passage.test.title} Test was #{result} Completed!"
  end

  def result_color(test_passage)
    test_passage.success_result? ? 'green' : 'red'
  end
end
