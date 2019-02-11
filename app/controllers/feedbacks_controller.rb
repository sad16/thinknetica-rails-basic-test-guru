class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      FeedbackMailer.with(feedback: @feedback).email.deliver_now
      redirect_to feedback_path, notice: t('.sended')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :name, :message)
  end
end
