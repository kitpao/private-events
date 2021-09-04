class ApplicationController < ActionController::Base
  helper_method :current_user, :sign_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in?
    current_user ? true : false
  end

  def require_user
    flash[:danger] = 'You must be logged in to perform this action' unless sign_in?
    redirect_to root_path unless sign_in?
  end

  def current_event #some change here
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
