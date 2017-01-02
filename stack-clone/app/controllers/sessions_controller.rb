class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session])
      redirect_to root_path
    else
      @errors = ['Invalid Username/Password Combination']
      render 'new'
    end
  end
end
