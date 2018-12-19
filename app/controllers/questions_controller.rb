class QuestionsController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy]

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @test = @question.test
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_not_found
    head :not_found
  end
end
