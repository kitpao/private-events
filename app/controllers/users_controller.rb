class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user][:name])
    if @user.save
      flash[:success] = "User created succesfully"
      redirect_to show_user_path
    else
      flash.now[:notice] = "Ups.. something went wrong"
      render :new
    end
  end
end