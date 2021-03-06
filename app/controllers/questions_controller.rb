class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render :index
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
    render :show
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    if @question.save
      redirect_to question_url(@question)
    else
      @errors = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to question_url(@question)
    else
      @errors = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to :root
  end

  private

  def question_params
    params.require(:question).permit(:title, :question_text)
  end
end
