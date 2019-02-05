class GistsController < ApplicationController
  before_action :find_test_passage, only: :create

  def create
    question = @test_passage.current_question

    result = GistQuestionService.new(question).call
    gist = current_user.gists.create(question: question, url: result.url) if result.success?

    redirect_to @test_passage, flash_options(gist)
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def flash_options(gist)
    if gist && gist.persisted?
      { notice: t('.success', url: gist.url) }
    else
      { alert: t('.failure') }
    end
  end
end
