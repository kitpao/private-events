class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_name(params[:user][:name])
    #remember to make unique names
    if user && !user.nil?
      session[:user_id] = user.id
      redirect_to user_path(user)
      #link_to dashboard
    else
      redirect_to signup_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end