class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:session][:name].downcase)
    if user && !user.nil?
      session[:user_id] = user.id
      flash[:success] = 'You have logged in!'
      redirect_to user_path(user)
      # link_to dashboard
    else
      flash[:notice] = 'Account doesn\'t exist, please sign up'
      redirect_to sign_up_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end
end
