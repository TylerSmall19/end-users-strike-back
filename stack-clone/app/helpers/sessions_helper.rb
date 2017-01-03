module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session[:user_id] = nil
  end

  def owner?(post)
    # Questions and answers both have the "author" attribute
    post.author == current_user
  end
end
