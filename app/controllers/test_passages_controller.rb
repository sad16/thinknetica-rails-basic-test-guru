class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.complete!
      binding.pry
      current_user.badges << Badge.assignable(@test_passage)
      TestPassageMailer.result_email(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
