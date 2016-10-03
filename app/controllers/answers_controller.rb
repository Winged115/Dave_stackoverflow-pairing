class AnswersController < ApplicationController

# need to edit these methods to turn them into answers after breakout - or bo (body odor, yo)
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(@answer.question.id)
    @answer.assign_attributes(user_id: session[:user_id], question_id: @question.id)
    if @answer.save
      redirect_to question_url(@question)
    else
      @errors = @answer.errors.full_messages
      render "questions/show"
    end
  end

  def edit
    @question = Question.find(params[:id])
    @answer = Answer.find_by(id: params[:id], question_id: @question.id)
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
    @answer = Answer.find(params[:id])
    # authorize users
    @answer.destroy
    redirect_to question_url(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_text, :user_id, :question_id)
  end
end
