class QuestionsController < ApplicationController
  def new
  end

  def create
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
    @questions = Question.all
  end
end
