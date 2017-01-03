class AnswersController < ApplicationController
  def create
    @question = Question.find_by(id: params[:id])
    if logged_in?
      answer = @question.answers.new(answer_params)
      answer.author = current_user
      if answer.save
        render '/questions/show'
      else
        @errors = answer.errors.full_messages
        render '/questions/show'
      end
    else
      redirect_to root_path
    end
  end

  def update
    answer = Answer.find_by(id: params[:answer_id])
    answer.assign_attributes(answer_params)
    if logged_in? && owner?(answer)
      if answer.save
        redirect_to answer.question
      else
        @errors = answer.errors.full_messages
        render 'edit'
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:answer_id])
    unless logged_in? && owner?(@answer)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    answer = Answer.find_by(id: params[:answer_id])
    question = answer.question

    if answer && logged_in? && owner?(answer)
      answer.destroy
      redirect_to question
    else
      redirect_to root_path
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
