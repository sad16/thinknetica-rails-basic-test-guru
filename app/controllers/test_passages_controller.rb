class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result]
  before_action :check_timer, only: [:show]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      current_user.badges << Badge.assignable(@test_passage)
      deliver_email_and_show_result
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
    deliver_email_and_show_result unless @test_passage.timer_valid?
  end

  def deliver_email_and_show_result
    TestPassageMailer.result_email(@test_passage).deliver_now
    redirect_to result_test_passage_path(@test_passage)
  end
end
