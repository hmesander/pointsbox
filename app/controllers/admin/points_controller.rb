class Admin::PointsController < Admin::BaseController
  def new
    @point = Point.new
  end

  def create
    @user = User.find(params[:user_id])
    @point = @user.points.create!
    @user.update_points
    redirect_to admin_user_path(@user)
  end

  def destroy
    @point = User.find(params[:user_id]).points.last.destroy
    redirect_to admin_user_path(@point.user)
  end
end
