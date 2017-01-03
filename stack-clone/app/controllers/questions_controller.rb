class QuestionsController < ApplicationController
  def new
  end

  def create
    redirect_to root unless logged_in?
    question = Question.new(question_params)
    question.author = current_user
    if question.save
      redirect_to question
    else
      @errors = question.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def destroy
  end

  def update
  end

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  private
  def question_params
    params.require(:question).permit(:title, :question)
  end
end
