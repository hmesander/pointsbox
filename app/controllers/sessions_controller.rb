class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] = "You are now logged in!"
      session[:user_id] = user.id
      if user.role == 'admin'
        redirect_to admin_users_path
      else
        redirect_to user_path(user)
      end
    else
      flash[:notice] = "Try again!"
      render :new
    end
  end

  def destroy
    flash[:notice] = "You have logged out!"
    session.clear
    redirect_to root_path
  end
end
