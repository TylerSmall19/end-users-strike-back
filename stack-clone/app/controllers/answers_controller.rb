class AnswersController < ApplicationController
  def create
    @question = Question.find_by(id: params[:id])
    if logged_in?
      answer = @question.answers.create(answer_params)
      answer.author = current_user
      if answer.save

      else
        @errors = answer.errors.full_messages
        render '/questions/show'
      end
    else
      redirect_to root_path
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
