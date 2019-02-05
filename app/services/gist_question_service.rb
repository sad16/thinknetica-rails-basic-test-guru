class GistQuestionService
  Result = Struct.new(:status, :url) do
    def success?
      status == :success
    end
  end

  attr_reader :question, :test, :result, :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @result = Result.new(:failture)
    @client = client || default_client
  end

  def call
    result.url = client.create_gist(gist_options).html_url
    result.status = :success
  rescue Octokit::ClientError
    result.status = :failture
  ensure
    return result
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_GIST_ACCESS_TOKEN'])
  end

  def gist_options
    {
      description: I18n.t('services.gist_question_service.description', title: test.title),
      public: true,
      files: {
        gist_file_name => {
          content: gist_content
        }
      }
    }
  end

  def gist_file_name
    "#{Time.current.to_i}_t#{test.id}_q#{question.id}"
  end

  def gist_content
    content = [question.body]
    content += question.answers.pluck(:body)
    content.join("\n")
  end
end
