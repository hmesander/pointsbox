class PointsController < ApplicationController
  def create
    params[:point][:number].to_i.times do
      Point.create(point_params)
    end
    user = User.find(point_params[:user_id])
    flash.notice = "Points were added to #{user.username}'s Profile!"
    redirect_to user_path(user)
  end

  private
    def point_params
      params.require(:point).permit(:user_id, :status)
    end
end
