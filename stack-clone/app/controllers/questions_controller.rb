class QuestionsController < ApplicationController
  def new
    @question = Question.new
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
    @question = Question.find_by(id: params[:id])
    # form_for can tell the difference between update and create form
    render 'new'
  end

  def show
    @answer = Answer.new
    @question = Question.find_by(id: params[:id])
  end

  def destroy
    question = Question.find_by(id: params[:id])
    if logged_in? && owner?(question)
      question.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    question = Question.find_by(id: params[:id])
    if logged_in? && owner?(question)
      question.assign_attributes(question_params)
      if question.save
        redirect_to question
      else
        @errors = question.errors.full_messages
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  private
  def question_params
    params.require(:question).permit(:title, :question)
  end
end
