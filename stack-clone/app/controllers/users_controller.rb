class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login user
      redirect_to root_path
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
