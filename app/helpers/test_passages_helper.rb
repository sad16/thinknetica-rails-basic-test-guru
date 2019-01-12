module TestPassagesHelper
  def result_title(result, test_title)
    string = result >= 85 ? 'Successfully' : 'Unsuccessfully'

    "The #{test_title} Test was #{string} Completed!"
  end

  def result_color(result)
    result >= 85 ? 'green' : 'red'
  end
end
