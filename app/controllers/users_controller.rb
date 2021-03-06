class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if current_admin?
        redirect_to admin_users_path
      else
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      flash[:notice] = 'Try again!'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @correct_user = current_user == @user
    @users = User.all
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
