class GistsController < ApplicationController
  before_action :find_test_passage, only: :create

  def create
    question = @test_passage.current_question
    url = GistQuestionService.new(question).call
    gist = current_user.gists.new(question: question, url: url)

    if gist.save
      flash[:notice] = t('.success', link: helpers.link_to(gist.text_id, gist.url, target: :blank))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
