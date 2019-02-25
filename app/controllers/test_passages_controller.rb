class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result]
  before_action :check_timer, only: [:show, :update]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.complete!
      current_user.badges << Badge.assignable(@test_passage)
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

  def check_timer
    return if @test_passage.timer_valid?

    @test_passage.complete!(timer_valid: false)
    redirect_to result_test_passage_path(@test_passage)
  end
end
