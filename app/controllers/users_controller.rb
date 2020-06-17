class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User created succesfully"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Ups.. something went wrong"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
