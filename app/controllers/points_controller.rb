class PointsController < ApplicationController
  def create
    point = Point.new(point_params)
    user = User.find(point_params[:user_id])
    if point.save
      flash.notice = "Points were added to #{user.username}'s Profile!"
      redirect_to admin_users_path
    else
      flash.notice = 'Missing required information'
      render new_admin_point_path
    end
  end

  private
    def point_params
      params.require(:point).permit(:user_id, :status, :number)
    end
end
