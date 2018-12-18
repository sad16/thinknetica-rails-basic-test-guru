class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  before_action :find_test
  before_action :find_question, only: [:show, :destr]

  def index
    render json: @test.questions, status: :ok
  end

  def show
    render json: @question, status: :ok
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    render :new and return unless @question.save

    redirect_to test_question_path(@test, @question)
  end

  def destroy
    @question.destroy
    
    redirect_to test_question_path(@test, @question)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_not_found
    head :not_found
  end
end
