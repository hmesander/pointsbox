class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash[:notice] = "You don't have access to this page!"
      redirect_to root_path
      return
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
