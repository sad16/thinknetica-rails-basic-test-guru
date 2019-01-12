class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
    @result = (@test_passage.correct_questions.to_f / 
      @test_passage.test.questions.count.to_f * 100).round
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
