class ApplicationController < ActionController::Base
  helper_method :current_user, :sign_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in?
    !!current_user
  end

  def require_user
    if !sign_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end

  def current_event
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
