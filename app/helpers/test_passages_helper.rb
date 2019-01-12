module TestPassagesHelper
  SUCCESS_PERSENT = 85.freeze

  def result_title(result, test_title)
    string = result >= SUCCESS_PERSENT ? 'Successfully' : 'Unsuccessfully'
    "The #{test_title} Test was #{string} Completed!"
  end

  def result_color(result)
    result >= SUCCESS_PERSENT ? 'green' : 'red'
  end
end
